# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mcauchy <mcauchy@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/25 14:15:13 by mcauchy           #+#    #+#              #
#    Updated: 2022/08/25 14:41:36 by mcauchy          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FILES	= 	lifeGame.c\
			ft_split.c\
			get_changes.c\
			get_grid.c\
			get_struct.c

SRC_DIR =	srcs

DIR_OBJ	=	.objs

SRCS	=	$(addprefix $(SRC_DIR)/, $(FILES))

OBJS 	=	$(addprefix $(DIR_OBJ)/, $(notdir $(SRCS:.c=.o)))

CC		=	gcc

CFLAGS	=	-g3

NAME	=	lifeGame

HEADERS	=	lifeGame.h

all		:	$(NAME)


$(NAME)	:	$(OBJS)
			@$(CC) $(CFLAGS) $^ -o $@
			@echo "Compilation done"

$(DIR_OBJ)/%.o	:	$(SRC_DIR)/%.c $(HEADERS)
					@mkdir -p $(@D)
					@echo "Compiling $(notdir $<)..."
					@$(CC) $(CFLAGS) -o $@ -c $<

clean			:
					@/bin/rm -f $(OBJS)
					@/bin/rm -rf $(DIR_OBJ)
					@clear
					@echo "Cleaned."

fclean			:	clean
					@clear
					@/bin/rm -f $(NAME)
					@clear
					@echo "Fully cleaned."

re				:	fclean all
					@clear
					@echo "Re-compiled."

