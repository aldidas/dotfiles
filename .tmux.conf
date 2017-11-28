unbind C-b
set -g prefix C-a
set-option -g default-command "reattach-to-user-namespace -l $SHELL"
set -g -a terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'

# 0 is too far from ` ;)
set -g base-index 1

# Automatically set window title
set-window-option -g automatic-rename on
set-option -g set-titles on

set -g status-keys vi
set -g history-limit 10000

setw -g mode-keys vi
setw -g mouse on
setw -g monitor-activity on
set -g @resurrect-strategy-vim 'session'

bind-key v split-window -h -c '#{pane_current_path}'
bind-key s split-window -v -c '#{pane_current_path}'

bind-key J resize-pane -D 5
bind-key K resize-pane -U 5
bind-key H resize-pane -L 5
bind-key L resize-pane -R 5

bind-key M-j resize-pane -D
bind-key M-k resize-pane -U
bind-key M-h resize-pane -L
bind-key M-l resize-pane -R

# Vim style pane selection
bind h select-pane -L
bind j select-pane -D 
bind k select-pane -U
bind l select-pane -R

# Use Alt-vim keys without prefix key to switch panes
bind -n M-h select-pane -L
bind -n M-j select-pane -D 
bind -n M-k select-pane -U
bind -n M-l select-pane -R

# Use Alt-arrow keys without prefix key to switch panes
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Shift arrow to switch windows
bind -n S-Left  previous-window
bind -n S-Right next-window

# No delay for escape key press
set -sg escape-time 0

# copy - paste stuff
setw -g mode-keys vi
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi y send-keys -X copy-pipe "reattach-to-user-namespace pbcopy"
unbind -T copy-mode-vi Enter
bind-key -T copy-mode-vi Enter send-keys -X copy-pipe "reattach-to-user-namespace pbcopy"
bind ] run "reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer"

# Reload tmux config
bind r source-file ~/.tmux.conf

# THEME
######################
### DESIGN CHANGES ###
######################

# panes
set -g pane-border-fg black
set -g pane-active-border-fg brightred

## Status bar design
# status line
set -g status-justify left
set -g status-bg default
set -g status-fg colour12
set -g status-interval 2

# messaging
set -g message-fg black
set -g message-bg yellow
set -g message-command-fg blue
set -g message-command-bg black

# loud or quiet?
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence off
set-window-option -g monitor-activity off
set-option -g bell-action none

 #The modes {
setw -g clock-mode-colour colour132
setw -g mode-attr bold
setw -g mode-fg colour124
setw -g mode-bg colour235

 #}
 #The panes {

set -g pane-border-bg colour235
set -g pane-border-fg colour235
set -g pane-active-border-bg colour235
set -g pane-active-border-fg colour250

 #}
 #The statusbar {

set -g status-position bottom
set -g status-bg colour237
set -g status-fg colour246
set -g status-attr dim
set -g status-left ' ♞  '
set -g status-right '#[fg=colour235,bg=colour208] aldidas #[fg=colour235,bg=colour166] #S '
set -g status-right-length 40
set -g status-left-length 20

setw -g window-status-current-fg colour214
setw -g window-status-current-bg colour235
setw -g window-status-current-attr bold
setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F '

setw -g window-status-fg colour132
setw -g window-status-bg colour238
setw -g window-status-attr none
setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '

setw -g window-status-bell-attr bold
setw -g window-status-bell-fg colour255
setw -g window-status-bell-bg colour1

## }
## The messages {

set -g message-attr bold
set -g message-fg colour232
set -g message-bg colour166

## }

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'

run '~/.tmux/plugins/tpm/tpm'
