CREATE OR REPLACE VIEW V_LEAGUE_TABLE AS
WITH TeamStats AS (
SELECT
home_team_id as team_id,
league_id,
COUNT(*) as pld,
SUM(CASE WHEN score_home > score_away THEN 1 ELSE 0 END) as wins,
SUM(CASE WHEN score_home = score_away THEN 1 ELSE 0 END) as draws,
SUM(CASE WHEN score_home < score_away THEN 1 ELSE 0 END) as losses,
SUM(score_home) as gf,
SUM(score_away) as ga
FROM Match
GROUP BY home_team_id, league_id
UNION ALL
SELECT
away_team_id as team_id,
league_id,
COUNT(*) as pld,
SUM(CASE WHEN score_away > score_home THEN 1 ELSE 0 END) as wins,
SUM(CASE WHEN score_away = score_home THEN 1 ELSE 0 END) as draws,
SUM(CASE WHEN score_away < score_home THEN 1 ELSE 0 END) as losses,
SUM(score_away) as gf,
SUM(score_home) as ga
FROM Match
GROUP BY away_team_id, league_id
),
AggregatedStats AS (
SELECT
team_id,
league_id,
SUM(pld) as pld,
SUM(wins) as wins,
SUM(draws) as draws,
SUM(losses) as losses,
SUM(gf) as gf,
SUM(ga) as ga,
SUM(wins * 3 + draws * 1) as pts,
SUM(gf - ga) as gd
FROM TeamStats
GROUP BY team_id, league_id
)
SELECT 
    RANK() OVER (ORDER BY NVL(s.pts, 0) DESC, NVL(s.gd, 0) DESC, NVL(s.gf, 0) DESC) as position,
    t.name as team_name,
    NVL(s.pld, 0) as pld,
    NVL(s.wins, 0) as wins,
    NVL(s.draws, 0) as draws,
    NVL(s.losses, 0) as losses,
    NVL(s.gf, 0) || '-' || NVL(s.ga, 0) as goals,
    NVL(s.gd, 0) as goal_diff,
    NVL(s.pts, 0) as pts
FROM Team t
LEFT JOIN AggregatedStats s ON t.club_id = s.team_id;
CREATE OR REPLACE VIEW V_PLAYER_STATS AS
SELECT
m.first_name || ' ' || m.last_name as player_full_name,
t.name as team_name,
p.position,
(SELECT COUNT(*) FROM Match_event e WHERE e.player_id = p.member_id AND e.event_type = 'GOAL') as goals,
(SELECT COUNT(*) FROM Match_event e WHERE e.player_id = p.member_id AND e.event_type = 'ASSIST') as assists,
(SELECT COUNT(*) FROM Match_event e WHERE e.player_id = p.member_id AND e.event_type = 'YELLOW_CARD') as yellow_cards,
(SELECT COUNT(*) FROM Match_event e WHERE e.player_id = p.member_id AND e.event_type = 'RED_CARD') as red_cards,
p.member_id as player_id,
t.club_id
FROM Player p
JOIN Member m ON p.member_id = m.member_id
JOIN Team t ON p.club_id = t.club_id;
CREATE OR REPLACE VIEW V_TOP_SCORERS AS
SELECT player_full_name, team_name, goals
FROM V_PLAYER_STATS
WHERE goals > 0
ORDER BY goals DESC;
CREATE OR REPLACE VIEW V_TOP_ASSISTANTS AS
SELECT player_full_name, team_name, assists
FROM V_PLAYER_STATS
WHERE assists > 0
ORDER BY assists DESC;
CREATE OR REPLACE VIEW V_MOST_CARDS AS
SELECT
player_full_name,
team_name,
yellow_cards,
red_cards,
(yellow_cards * 1 + red_cards * 3) as discipline_points
FROM V_PLAYER_STATS
WHERE yellow_cards > 0 OR red_cards > 0
ORDER BY discipline_points DESC;
CREATE OR REPLACE VIEW V_CLEAN_SHEETS AS
SELECT
m.first_name || ' ' || m.last_name as goalkeeper_name,
t.name as team_name,
COUNT(*) as clean_sheets
FROM Match_event me
JOIN Match ma ON me.match_id = ma.match_id
JOIN Player p ON me.player_id = p.member_id
JOIN Member m ON p.member_id = m.member_id
JOIN Team t ON p.club_id = t.club_id
WHERE me.event_type = 'ENTRY'
AND p.position LIKE '%Bramkarz%'
AND (
(ma.home_team_id = t.club_id AND ma.score_away = 0) OR
(ma.away_team_id = t.club_id AND ma.score_home = 0)
)
GROUP BY m.first_name, m.last_name, t.name
ORDER BY clean_sheets DESC;
CREATE OR REPLACE VIEW V_CLUB_OVERVIEW AS
SELECT
t.club_id,
t.name as team_name,
t.city,
t.founded_year,
(SELECT m.first_name || ' ' || m.last_name FROM Coach c JOIN Member m ON c.member_id = m.member_id WHERE c.club_id = t.club_id AND ROWNUM = 1) as current_coach,
(SELECT s.name FROM Stadium s WHERE s.city = t.city AND ROWNUM = 1) as stadium_name,
(SELECT COUNT(*) FROM Player p WHERE p.club_id = t.club_id) as squad_count
FROM Team t;
CREATE OR REPLACE VIEW V_SEASON_GENERAL_STATS AS
SELECT
l.name as league_name,
l.season,
(SELECT COUNT(*) FROM Match m WHERE m.league_id = l.league_id) as total_matches,
(SELECT SUM(score_home + score_away) FROM Match m WHERE m.league_id = l.league_id) as total_goals,
NVL(ROUND((SELECT SUM(score_home + score_away) FROM Match m WHERE m.league_id = l.league_id) /
NULLIF((SELECT COUNT(*) FROM Match m WHERE m.league_id = l.league_id), 0), 2), 0) as avg_goals_per_match
FROM League l;
