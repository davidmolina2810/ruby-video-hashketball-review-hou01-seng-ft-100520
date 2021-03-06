# Write your code below game_hash

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(player)
  points = 0
  game_hash.each do |team, team_hash|
    team_hash[:players].each  do |player_hash|
      if player_hash[:player_name] == player
            points = player_hash[:points]
      end
    end
  end
  points
end

def shoe_size(player)
  size = nil
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player_hash|
      if player_hash[:player_name] == player
        size = player_hash[:shoe]
      end
    end
  end
  size
end

def team_colors(team_name)
  colors = nil
  game_hash.each do |team, team_hash| 
    if team_hash[:team_name] == team_name
      colors = team_hash[:colors]
    end
  end
  colors
end

def team_names
  teams = []
  game_hash.each do |team, team_hash|
    teams << team_hash[:team_name]
  end
  teams
end

def player_numbers(team_name)
  nums = []
  game_hash.each do |team, team_hash|
    if team_hash[:team_name] == team_name
      team_hash[:players].each do |player|
        nums << player[:number]
      end
    end
  end
  nums 
end

def player_stats(player)
  stats = nil
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player_hash|
      if player_hash[:player_name] == player
        stats = player_hash
      end
    end
  end
  stats
end

def big_shoe_rebounds
  shoe = 0
  player = nil
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player_hash|
      if player_hash[:shoe] > shoe
        player = player_hash
        shoe = player_hash[:shoe]
      end
    end
  end
  player[:rebounds]
end

def most_points_scored
  max_points = 0 
  player = nil
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player_hash|
      if player_hash[:points] > max_points 
        player = player_hash[:player_name]
        max_points = player_hash[:points]
      end
    end
  end
  player
end

def tie 
  puts "It's a tie."
end

def team_points(team)
  points = 0
  game_hash[team][:players].each do |player|
    points += player[:points]
  end
  points 
end

def winning_team
  home_team_pts = team_points(:home)
  away_team_pts = team_points(:away)
  winner = nil
  if home_team_pts > away_team_pts
    winner = game_hash[:home][:team_name]
  elsif away_team_pts > home_team_pts
    winner = game_hash[:away][:team_name]
  else
    tie
  end
end
    
