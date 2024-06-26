# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gade-oli <gade-oli@student.42madrid.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/16 11:53:14 by gade-oli          #+#    #+#              #
#    Updated: 2023/11/03 12:00:38 by gade-oli         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =	megalibft.a

RM	=	/bin/rm -f

CC	=	gcc

CFLAGS =	-Wall -Wextra -Werror -g

SRC	= 	src/ft_isalpha.c src/ft_isdigit.c src/ft_isalnum.c src/ft_isascii.c src/ft_isprint.c src/ft_strlen.c src/ft_memset.c \
		src/ft_bzero.c src/ft_memcpy.c src/ft_memmove.c src/ft_strlcpy.c src/ft_strlcat.c src/ft_toupper.c src/ft_tolower.c \
		src/ft_strrchr.c src/ft_strchr.c src/ft_strncmp.c src/ft_atoi.c src/ft_memchr.c src/ft_memcmp.c src/ft_strdup.c \
		src/ft_calloc.c src/ft_strnstr.c src/ft_strmapi.c src/ft_striteri.c src/ft_substr.c src/ft_strjoin.c src/ft_strtrim.c \
		src/ft_putchar_fd.c src/ft_putstr_fd.c src/ft_putendl_fd.c src/ft_split.c src/ft_itoa.c src/ft_putnbr_fd.c \
		src/get_next_line.c src/ft_printf.c src/printf_utils/ft_cs.c src/printf_utils/ft_di.c src/printf_utils/ft_pxX.c src/printf_utils/ft_u.c

OBJS =	${SRC:src/%.c=bin/%.o}

SRCBONUS = src/ft_lstnew_bonus.c src/ft_lstsize_bonus.c src/ft_lstlast_bonus.c src/ft_lstadd_front_bonus.c src/ft_lstadd_back_bonus.c \
			src/ft_lstdelone_bonus.c src/ft_lstclear_bonus.c src/ft_lstiter_bonus.c src/ft_lstmap_bonus.c

OBJBONUS = ${SRCBONUS:src/%.c=bin/%.o}

all:		${NAME}

bin/%.o:	src/%.c
			@mkdir -p $(@D)
			$(CC) $(CFLAGS) -c $< -o $@

${NAME}:	${OBJS} ${OBJBONUS}
			ar -rcs ${NAME} ${OBJS} ${OBJBONUS}

clean:		
			${RM} ${OBJS} ${OBJBONUS}

fclean:		clean
			${RM} ${NAME}

re:			fclean all

.PHONY:		all clean fclean re
