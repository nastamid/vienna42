# Basic configuration
NAME = libft.a
CC = cc
CFLAGS = -Wextra -Werror -Wall -MP -MD

# Source files
CFILES = ft_atoi.c\
		ft_bzero.c\
		ft_calloc.c\
		ft_isalnum.c\
		ft_isalpha.c\
		ft_isascii.c\
		ft_isdigit.c\
		ft_isprint.c\
		ft_itoa.c\
		ft_memchr.c\
		ft_memcmp.c\
		ft_memcpy.c\
		ft_memmove.c\
		ft_memset.c\
		ft_putchar_fd.c\
		ft_putendl_fd.c\
		ft_putnbr_fd.c\
		ft_putstr_fd.c\
		ft_split.c\
		ft_strchr.c\
		ft_strdup.c\
		ft_striteri.c\
		ft_strjoin.c\
		ft_strlcat.c\
		ft_strlcpy.c\
		ft_strlen.c\
		ft_strmapi.c\
		ft_strncmp.c\
		ft_strnstr.c\
		ft_strrchr.c\
		ft_strtrim.c\
		ft_substr.c\
		ft_tolower.c\
		ft_toupper.c
BONUS_CFILES = 	ft_lstadd_back_bonus.c\
		ft_lstadd_front_bonus.c\
		ft_lstclear_bonus.c\
		ft_lstdelone_bonus.c\
		ft_lstiter_bonus.c\
		ft_lstlast_bonus.c\
		ft_lstmap_bonus.c\
		ft_lstnew_bonus.c\
		ft_lstsize_bonus.c

# Object files
OBJECTS = $(CFILES:.c=.o)
BONUS_OBJECTS = $(BONUS_CFILES:.c=.o)

# Dependency files
DEPFILES = $(CFILES:.c=.d)
BONUS_DEPFILES = $(BONUS_CFILES:.c=.d)

# Build the library without bonus files
all: $(NAME)

$(NAME): $(OBJECTS)
	ar rcs $@ $^

# Build the library with bonus files
bonus: $(NAME) $(BONUS_OBJECTS)
	ar rcs $(NAME) $(BONUS_OBJECTS)

# Compile .c files to .o files
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Clean temporary files
clean_temp:
	rm -f $(OBJECTS) $(BONUS_OBJECTS) $(DEPFILES) $(BONUS_DEPFILES)

# Clean all generated files
clean: clean_temp
	rm -f $(NAME)

# Force clean and rebuild
fclean: clean

re: fclean all

# Mark targets as not files
.PHONY: all clean clean_temp fclean re bonus