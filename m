Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F31A2DFA64
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Dec 2020 10:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgLUJss (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Dec 2020 04:48:48 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:30526 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727786AbgLUJso (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Dec 2020 04:48:44 -0500
Received: from grover.flets-west.jp (softbank126090214151.bbtec.net [126.90.214.151]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0BL9kqvk030489;
        Mon, 21 Dec 2020 18:46:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0BL9kqvk030489
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608544013;
        bh=sdrMq2j88FjQQll46LtKjIWrP9gks/ixgBElE8/WJm8=;
        h=From:To:Cc:Subject:Date:From;
        b=LMnRCVZP1gN6CGu/NI5KvP94XPYnEmxJuroI8b7dbrrJlSxGyvPD5+g5TxQXnXCtl
         WZTzupFFXJcME8spRbFO1zeKUwywkABsmWoAPRLdCoL4vTlbzdv+J8PaZVF5g5VnS8
         xO/W4oC6qRU7VPaChn5qyTCR1q3TZ4YOlAkrtExh2AcMfksxx9tZgLkF9YhS5o43g/
         dSlBzV58d7olDMp3yD6zJHK4gjnuCYM9O97wXbkC1YhB4XBzu5ha3gFb95hHtM4KCC
         aQ0ezmPCsWdUTNLyJzLQAWkQka1ANlzY2NOoXt7R+UI66yF6GaRviX7Rpf4G/nTUyt
         hANd15YMEchmA==
X-Nifty-SrcIP: [126.90.214.151]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: drop filename and line number prefix from warning/error-if macros
Date:   Mon, 21 Dec 2020 18:46:49 +0900
Message-Id: <20201221094650.283511-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

GNU Make prints the messages passed to info, warning, error functions
in a different format, and I am not a big fan of it.

For example, the following code in Makefile:

  $(info This is an info message)
  $(warning This is a warning message)
  $(error This is an error message)

... will print messages like follows:

  This is an info message
  Makefile:2: This is a warning message
  Makefile:3: *** This is an error message.  Stop.

$(info ...) prints the given message as-is. $(warning ...) prepends
the file name and line number to the given message. In addition to it,
$(error ...) adds "***" and ".  Stop." as well.

Since GNU Make cannot handle escape sequences such as '\n', when we
want to print multiple lines of warning messages, we generally call
$(warning ...) for each line, like this:

  $(warning This is the first line)
  $(warning This is the second line)
  $(warning This is the last line)

When we want to print multiple lines of error messages, we turn only
the last one to $(error ...). (If you turned all $(warning ...) calls
into $(error ...), only the first line of the error message would be
printed.)

  $(warning This is the first line)
  $(warning This is the second line)
  $(error This is the last line)

This, however, will result in odd output due to the "***" prefix.

  Makefile:1: This is the first line
  Makefile:2: This is the second line
  Makefile:3: *** This is the last line.  Stop.

When I implemented the Kconfig macro language, I took the GNU Make
behavior as a reference in general, but I did not follow the message
format of $(error ...) to avoid that annoyance.

So, the following code in Kconfig:

  $(warning-if,y,This is the first line)
  $(warning-if,y,This is the second line)
  $(error-if,y,This is the last line)

... will print the messages in a consistent format:

  Kconfig:1: This is the first line
  Kconfig:2: This is the second line
  Kconfig:3: This is the last line

But, in hindsight, the built-in functions should have only primitive
functionality to print the given message without any prefix. The lesson
I learned from GNU Make was such a prefix is easy to add, difficult to
remove.

This commit changes the built-in functions, warning-if and error-if, to
not print the file name or the line number.

This makes the language specification more natural and simple. Also the
message format from $(info,...), $(warning-if,...), $(error-if,...)
will become symmetrical.

Prefixing the file name and the line number to error messages is useful
(but should not be a part of the language specification), so now it is
implemented as a macro in scripts/Kconfig.include.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 .../kbuild/kconfig-macro-language.rst         |  3 +--
 scripts/Kconfig.include                       | 10 +++++++---
 scripts/kconfig/preprocess.c                  |  9 +++++----
 .../preprocess/builtin_func/expected_stderr   | 10 +++++-----
 .../tests/preprocess/escape/expected_stderr   | 20 +++++++++----------
 .../tests/preprocess/variable/expected_stderr | 18 ++++++++---------
 6 files changed, 37 insertions(+), 33 deletions(-)

diff --git a/Documentation/kbuild/kconfig-macro-language.rst b/Documentation/kbuild/kconfig-macro-language.rst
index 6163467f6ae4..8eca2c5f1a00 100644
--- a/Documentation/kbuild/kconfig-macro-language.rst
+++ b/Documentation/kbuild/kconfig-macro-language.rst
@@ -120,8 +120,7 @@ Kconfig currently supports the following built-in functions.
  - $(warning-if,condition,text)
 
   The "warning-if" function takes two arguments. If the condition part is "y",
-  the text part is sent to stderr. The text is prefixed with the name of the
-  current Kconfig file and the current line number.
+  the text part is sent to stderr.
 
  - $(error-if,condition,text)
 
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index a5fe72c504ff..de8dcffc60c1 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -11,6 +11,10 @@ dollar      := $
 right_paren := )
 left_paren  := (
 
+# works like 'error-if', but prefix the file name and the line number to
+# the message.
+error-loc-if = $(error-if,$(1),$(filename):$(lineno): $(2))
+
 # $(if-success,<command>,<then>,<else>)
 # Return <then> if <command> exits with 0, <else> otherwise.
 if-success = $(shell,{ $(1); } >/dev/null 2>&1 && echo "$(2)" || echo "$(3)")
@@ -36,11 +40,11 @@ ld-option = $(success,$(LD) -v $(1))
 as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
 
 # check if $(CC) and $(LD) exist
-$(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
-$(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
+$(error-loc-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
+$(error-loc-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
 
 # Fail if the linker is gold as it's not capable of linking the kernel proper
-$(error-if,$(success, $(LD) -v | grep -q gold), gold linker '$(LD)' not supported)
+$(error-loc-if,$(success, $(LD) -v | grep -q gold), gold linker '$(LD)' not supported)
 
 # machine bit flags
 #  $(m32-flag): -m32 if the compiler supports it, or an empty string otherwise.
diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index 0590f86df6e4..974929b0918b 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -111,8 +111,10 @@ struct function {
 
 static char *do_error_if(int argc, char *argv[])
 {
-	if (!strcmp(argv[0], "y"))
-		pperror("%s", argv[1]);
+	if (!strcmp(argv[0], "y")) {
+		fprintf(stderr, "%s\n", argv[1]);
+		exit(1);
+	}
 
 	return xstrdup("");
 }
@@ -181,8 +183,7 @@ static char *do_shell(int argc, char *argv[])
 static char *do_warning_if(int argc, char *argv[])
 {
 	if (!strcmp(argv[0], "y"))
-		fprintf(stderr, "%s:%d: %s\n",
-			current_file->name, yylineno, argv[1]);
+		fprintf(stderr, "%s\n", argv[1]);
 
 	return xstrdup("");
 }
diff --git a/scripts/kconfig/tests/preprocess/builtin_func/expected_stderr b/scripts/kconfig/tests/preprocess/builtin_func/expected_stderr
index 33ea9ca38400..112d94043b41 100644
--- a/scripts/kconfig/tests/preprocess/builtin_func/expected_stderr
+++ b/scripts/kconfig/tests/preprocess/builtin_func/expected_stderr
@@ -1,5 +1,5 @@
-Kconfig:8: hello world 1
-Kconfig:18: hello world 3
-Kconfig:22: hello world  4
-Kconfig:26: filename=Kconfig
-Kconfig:27: lineno=27
+hello world 1
+hello world 3
+hello world  4
+filename=Kconfig
+lineno=27
diff --git a/scripts/kconfig/tests/preprocess/escape/expected_stderr b/scripts/kconfig/tests/preprocess/escape/expected_stderr
index 1c00957ddaa9..1768112277b2 100644
--- a/scripts/kconfig/tests/preprocess/escape/expected_stderr
+++ b/scripts/kconfig/tests/preprocess/escape/expected_stderr
@@ -1,10 +1,10 @@
-Kconfig:9: hello, world
-Kconfig:13:   ' " '"   ' ''' "'"
-Kconfig:17: $
-Kconfig:18: $$
-Kconfig:20: 1
-Kconfig:25: $(X)
-Kconfig:30: (
-Kconfig:35: $(X)
-Kconfig:39: $(X)
-Kconfig:44: $(
+hello, world
+  ' " '"   ' ''' "'"
+$
+$$
+1
+$(X)
+(
+$(X)
+$(X)
+$(
diff --git a/scripts/kconfig/tests/preprocess/variable/expected_stderr b/scripts/kconfig/tests/preprocess/variable/expected_stderr
index a4841c3fdff5..5903a7732008 100644
--- a/scripts/kconfig/tests/preprocess/variable/expected_stderr
+++ b/scripts/kconfig/tests/preprocess/variable/expected_stderr
@@ -1,9 +1,9 @@
-Kconfig:10: SIMPLE = 1
-Kconfig:16: RECURSIVE = 2
-Kconfig:22: SIMPLE = 1 3
-Kconfig:28: RECURSIVE = 2 4
-Kconfig:35: UNDEFINED_VARIABLE = 4
-Kconfig:41: AB = 5
-Kconfig:45: Hello, my name is John.
-Kconfig:50: Hello, my name is .
-Kconfig:53: Hello, my name is John.
+SIMPLE = 1
+RECURSIVE = 2
+SIMPLE = 1 3
+RECURSIVE = 2 4
+UNDEFINED_VARIABLE = 4
+AB = 5
+Hello, my name is John.
+Hello, my name is .
+Hello, my name is John.
-- 
2.27.0

