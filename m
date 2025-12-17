Return-Path: <linux-kbuild+bounces-10139-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F57CC962F
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 20:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0C6C30BC866
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 19:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A182D3A77;
	Wed, 17 Dec 2025 19:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSPmqU90"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7477E2D3727;
	Wed, 17 Dec 2025 19:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765998831; cv=none; b=rMIYXsfNEubJnPAdl6TieFp5mhJ00x83O8u31cA/Jyvvqdu2t9/yYY7ZXn+wdFJUSb1i5dnYebInFlOpdjb/Ip6RDTXE85/xwgLZsz0chZSuUlkjJON2bTlqx2hUW3RbvnCMMcHdeMgaHiSZzZdsYe/uUqJenHIYcNmf39Ph0P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765998831; c=relaxed/simple;
	bh=tiqnlmqxLlpyC5euG9rlZyzc6vaJNCws7xVczV6M7RA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Dp/J7knKhcbzRgD4RXIzAeWICSf0UycIbhiY3tw48KiyqrQ6/tV3JjJ4pWN4WmGikyYa4ByDl+WxwGyocNUbj0AOAIh9rPRagzfGIvhU4qzeKuOtgaZWhunDWtbuXFYDFNkZkXD38XQhXszXPfrRFBj93KiPtWFhLO/8vrjqfs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSPmqU90; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9D3C19421;
	Wed, 17 Dec 2025 19:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765998831;
	bh=tiqnlmqxLlpyC5euG9rlZyzc6vaJNCws7xVczV6M7RA=;
	h=From:Date:Subject:To:Cc:From;
	b=bSPmqU90lMI/KjUZHIMSjNUF/g2DnWZMHrmArNT86QPjPMD+SvENXu3m34nZxlCxL
	 tYCYByk39egn4CKYEYZaz8TiCt8l2ltNqn582lmTYpIUUHFoqVas7eRMr3Esf3uGaG
	 c3LHkEaOwQAUnfmcTBFzboueYreWsJ8cM3PTMj6JihiTuMBUUEr75fSk2k8UsItXI8
	 fgap7LGAV9iT3oF/w5rVEqJzM9MRlBAMVpc3WEdcskajo5SB38S+OEfekiRAutuqIf
	 kjV7WyHKOi0OJLH2IwUMafNO65XVifqcvESrRyY2K//cexAtqhRJ8Vqhcb7fL46gg2
	 ER8ivi737lstg==
From: Nicolas Schier <nsc@kernel.org>
Date: Wed, 17 Dec 2025 20:13:43 +0100
Subject: [PATCH] Revert "scripts/clang-tools: Handle included .c files in
 gen_compile_commands"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-revert-scripts-clang-rools-handle-included-c-files-v1-1-def5651446da@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOYAQ2kC/x2N0QrCMBAEf6Xk2QOTIrb+ivggl40ehKTc1SKU/
 ruHjwOzs3swqMDCbdiDYhOT3hziaQj8frYXSLJzSOd0iSleySXoSsYqy2rE1SXS3quR+7n6oHH
 9ZGRiKlJhhHEqwDRj5jF4eFEU+f5P74/j+AETX8vBhAAAAA==
X-Change-ID: 20251217-revert-scripts-clang-rools-handle-included-c-files-e38fee89e9c3
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
 Nicolas Schier <nsc@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765998834; l=9083;
 i=nsc@kernel.org; s=20250924; h=from:subject:message-id;
 bh=tiqnlmqxLlpyC5euG9rlZyzc6vaJNCws7xVczV6M7RA=;
 b=dfLKjt0TNbtOX2mFmGOhlwp/v4z2XC1jCF86+uCkqYseZPrVoClqQrx5mpAU502NBLYSZkOBo
 qiJyGm5ZqZrDVT/HDrn5XL9SjJAFJbw0LUYKgTRryoNFr7dDB/N6JRq
X-Developer-Key: i=nsc@kernel.org; a=ed25519;
 pk=+0ar7sBdSzOoVoXxW8B+48yZbV4azT4joSEm8UyP7z4=

This reverts commit 9362d34acf91a706c543d919ade3e651b9bd2d6f.

Dmitry Vyukov reported that commit 9362d34acf91 ("scripts/clang-tools:
Handle included .c files in gen_compile_commands") generates false
entries in some cases for C files that are included in other C files but
not meant for standalone compilation.

For properly forking clangd, including .c files is discouraged.

Reported-by: Dmitry Vyukov <dvyukov@google.com>
Closes: https://lore.kernel.org/r/CACT4Y+Z8aCz0XcoJx9XXPHZSZHxGF8Kx9iUbFarhpTSEPDhMfg@mail.gmail.com
Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
 scripts/clang-tools/gen_compile_commands.py | 135 ++--------------------------
 1 file changed, 7 insertions(+), 128 deletions(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 6f4afa92a466..96e6e46ad1a7 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -21,12 +21,6 @@ _DEFAULT_LOG_LEVEL = 'WARNING'
 _FILENAME_PATTERN = r'^\..*\.cmd$'
 _LINE_PATTERN = r'^(saved)?cmd_[^ ]*\.o := (?P<command_prefix>.* )(?P<file_path>[^ ]*\.[cS]) *(;|$)'
 _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
-
-# Pre-compiled regexes for better performance
-_INCLUDE_PATTERN = re.compile(r'^\s*#\s*include\s*[<"]([^>"]*)[>"]')
-_C_INCLUDE_PATTERN = re.compile(r'^\s*#\s*include\s*"([^"]*\.c)"\s*$')
-_FILENAME_MATCHER = re.compile(_FILENAME_PATTERN)
-
 # The tools/ directory adopts a different build system, and produces .cmd
 # files in a different format. Do not support it.
 _EXCLUDE_DIRS = ['.git', 'Documentation', 'include', 'tools']
@@ -88,6 +82,7 @@ def cmdfiles_in_dir(directory):
         The path to a .cmd file.
     """
 
+    filename_matcher = re.compile(_FILENAME_PATTERN)
     exclude_dirs = [ os.path.join(directory, d) for d in _EXCLUDE_DIRS ]
 
     for dirpath, dirnames, filenames in os.walk(directory, topdown=True):
@@ -97,7 +92,7 @@ def cmdfiles_in_dir(directory):
             continue
 
         for filename in filenames:
-            if _FILENAME_MATCHER.match(filename):
+            if filename_matcher.match(filename):
                 yield os.path.join(dirpath, filename)
 
 
@@ -154,87 +149,8 @@ def cmdfiles_for_modorder(modorder):
                     yield to_cmdfile(mod_line.rstrip())
 
 
-def extract_includes_from_file(source_file, root_directory):
-    """Extract #include statements from a C file.
-
-    Args:
-        source_file: Path to the source .c file to analyze
-        root_directory: Root directory for resolving relative paths
-
-    Returns:
-        List of header files that should be included (without quotes/brackets)
-    """
-    includes = []
-    if not os.path.exists(source_file):
-        return includes
-
-    try:
-        with open(source_file, 'r') as f:
-            for line in f:
-                line = line.strip()
-                # Look for #include statements.
-                # Match both #include "header.h" and #include <header.h>.
-                match = _INCLUDE_PATTERN.match(line)
-                if match:
-                    header = match.group(1)
-                    # Skip including other .c files to avoid circular includes.
-                    if not header.endswith('.c'):
-                        # For relative includes (quoted), resolve path relative to source file.
-                        if '"' in line:
-                            src_dir = os.path.dirname(source_file)
-                            header_path = os.path.join(src_dir, header)
-                            if os.path.exists(header_path):
-                                rel_header = os.path.relpath(header_path, root_directory)
-                                includes.append(rel_header)
-                            else:
-                                includes.append(header)
-                        else:
-                            # System include like <linux/sched.h>.
-                            includes.append(header)
-    except IOError:
-        pass
-
-    return includes
-
-
-def find_included_c_files(source_file, root_directory):
-    """Find .c files that are included by the given source file.
-
-    Args:
-        source_file: Path to the source .c file
-        root_directory: Root directory for resolving relative paths
-
-    Yields:
-        Full paths to included .c files
-    """
-    if not os.path.exists(source_file):
-        return
-
-    try:
-        with open(source_file, 'r') as f:
-            for line in f:
-                line = line.strip()
-                # Look for #include "*.c" patterns.
-                match = _C_INCLUDE_PATTERN.match(line)
-                if match:
-                    included_file = match.group(1)
-                    # Handle relative paths.
-                    if not os.path.isabs(included_file):
-                        src_dir = os.path.dirname(source_file)
-                        included_file = os.path.join(src_dir, included_file)
-
-                    # Normalize the path.
-                    included_file = os.path.normpath(included_file)
-
-                    # Check if the file exists.
-                    if os.path.exists(included_file):
-                        yield included_file
-    except IOError:
-        pass
-
-
 def process_line(root_directory, command_prefix, file_path):
-    """Extracts information from a .cmd line and creates entries from it.
+    """Extracts information from a .cmd line and creates an entry from it.
 
     Args:
         root_directory: The directory that was searched for .cmd files. Usually
@@ -244,8 +160,7 @@ def process_line(root_directory, command_prefix, file_path):
             Usually relative to root_directory, but sometimes absolute.
 
     Returns:
-        A list of entries to append to compile_commands (may include multiple
-        entries if the source file includes other .c files).
+        An entry to append to compile_commands.
 
     Raises:
         ValueError: Could not find the extracted file based on file_path and
@@ -261,47 +176,11 @@ def process_line(root_directory, command_prefix, file_path):
     abs_path = os.path.realpath(os.path.join(root_directory, file_path))
     if not os.path.exists(abs_path):
         raise ValueError('File %s not found' % abs_path)
-
-    entries = []
-
-    # Create entry for the main source file.
-    main_entry = {
+    return {
         'directory': root_directory,
         'file': abs_path,
         'command': prefix + file_path,
     }
-    entries.append(main_entry)
-
-    # Find and create entries for included .c files.
-    for included_c_file in find_included_c_files(abs_path, root_directory):
-        # For included .c files, create a compilation command that:
-        # 1. Uses the same compilation flags as the parent file
-        # 2. But compiles the included file directly (not the parent)
-        # 3. Includes necessary headers from the parent file for proper macro resolution
-
-        # Convert absolute path to relative for the command.
-        rel_path = os.path.relpath(included_c_file, root_directory)
-
-        # Extract includes from the parent file to provide proper compilation context.
-        extra_includes = ''
-        try:
-            parent_includes = extract_includes_from_file(abs_path, root_directory)
-            if parent_includes:
-                extra_includes = ' ' + ' '.join('-include ' + inc for inc in parent_includes)
-        except IOError:
-            pass
-
-        included_entry = {
-            'directory': root_directory,
-            'file': included_c_file,
-            # Use the same compilation prefix but target the included file directly.
-            # Add extra headers for proper macro resolution.
-            'command': prefix + extra_includes + ' ' + rel_path,
-        }
-        entries.append(included_entry)
-        logging.debug('Added entry for included file: %s', included_c_file)
-
-    return entries
 
 
 def main():
@@ -334,9 +213,9 @@ def main():
                 result = line_matcher.match(f.readline())
                 if result:
                     try:
-                        entries = process_line(directory, result.group('command_prefix'),
+                        entry = process_line(directory, result.group('command_prefix'),
                                              result.group('file_path'))
-                        compile_commands.extend(entries)
+                        compile_commands.append(entry)
                     except ValueError as err:
                         logging.info('Could not add line from %s: %s',
                                      cmdfile, err)

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251217-revert-scripts-clang-rools-handle-included-c-files-e38fee89e9c3

Best regards,
-- 
Nicolas


