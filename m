Return-Path: <linux-kbuild+bounces-9045-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EF1BC314F
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Oct 2025 02:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3A7719E0A36
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Oct 2025 00:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CE1287275;
	Wed,  8 Oct 2025 00:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=likewhatevs.io header.i=@likewhatevs.io header.b="VvosSrjl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Iq9mT3MQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FD128726C
	for <linux-kbuild@vger.kernel.org>; Wed,  8 Oct 2025 00:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759884392; cv=none; b=RZBzfb/fM/98SYKRCRcd+j+VHq/o55q5QVlrW9cEqGcIb1iFs1QUEKyE22lc/jg/QtOeChJdQIt9zCAa4gH2CrYPdKDd1J58apMhy1YkPgdKIVWBKR+QOYU67QhvgzUPS05tlQf7yEkBqO5M6qQHpGCXZkX+wEcj+UdDX/j4/7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759884392; c=relaxed/simple;
	bh=BrO/2eeIxcuY3cgbrqwU9SGvdL2LJII9mdphlavXyAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EM9vGRulFiGRZcqBZov5z1Vy6cyYiqQSWhDy2bbasQdOHyY3p4/NlJTJa3PqjikC8SEDGKNEO6Blt7t4ZK+vEIzEB+OGkLrxxN1j6J3PNaBjaPtDkM12AHxCkGf+LoYWMxnEe3XIxSLYxUcOFHGcH2a3MgPeko2qxkxTKemu7ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=likewhatevs.io; spf=pass smtp.mailfrom=likewhatevs.io; dkim=pass (2048-bit key) header.d=likewhatevs.io header.i=@likewhatevs.io header.b=VvosSrjl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Iq9mT3MQ; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=likewhatevs.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=likewhatevs.io
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 40AA5140057A;
	Tue,  7 Oct 2025 20:46:28 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 07 Oct 2025 20:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=likewhatevs.io;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1759884388; x=
	1759970788; bh=yo5MnYTjyoI0LhUTsp9996+aBpE/9GefqL1dql3Xwmw=; b=V
	vosSrjlkFkTDC+x4xDmWVKVd+3FXAJky1Udu8oXRSNDmAazPvWGQliUWWuql9xTE
	J2cJFbxDt/V4fElz/flvnpuBCRsGtSUDLnQp4Rj/IItC42YjKeffsgoNCPlYeydX
	Ku5/NA8IckDy7eE5A3XzFscF/FYN/og96wfof2cn9x2I1I1Bwgtmcf8wqgpLwG4M
	746rZtBMXyJ8j6XnWLeRHZ8e8zwwxP3EpDjX3Ffrfb3BztXakMhXLWVDYT1N22rs
	rWWAFoh+IKHZxweSyOYkk+429DkVtP06sa1LTxgC3Xi+UL5n4WiAUmHu4KFQNwCf
	PZP/R+4w9VIhP3cjs6Mxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1759884388; x=1759970788; bh=y
	o5MnYTjyoI0LhUTsp9996+aBpE/9GefqL1dql3Xwmw=; b=Iq9mT3MQxv/WihMPJ
	8qQ8vjDlTjYqUcPR732X244utOabyyJRh98E0BzxWPjq28dIYHjS2JvyFPNGFoAG
	b67LMFKOlo8PaKFt/wFou0BRUtIqfPM8pz0AUMgqIgOvu0FZVJKGhv6150+G3WTj
	66jwvr6Rx+AO68mQOuRvBQz5bsAdjcHA0Kk0Xwkd9LZBJQtKF0KDQuP8oYfWMz4j
	OnCGv55q0ER7HhZEo53ImtQsiX2jVNcAHRcIomhtJIZ8dO4kv8kWBUgs2npe6hRq
	nGvDU9ZREL8owMpmpmiUeajXZFt67KCyMUAaeqBHEHWgFHjwNmEzuBsqTqw2UP0J
	BHtUg==
X-ME-Sender: <xms:Y7TlaHqOOJ1nSN-BJRtgt3tZx-toSXg1d4DCtgcpIMbNpGkaApsZ-w>
    <xme:Y7TlaLpjd1rDZoIhJ0lZe96hre4LG7v-GzyK82HP6B1lVF4D6a_WG98uhwMZLTzzk
    nG3pRWhJs7EBjCeRme2ecjDKCyBeZ9-Dqhkstlarzk8yeDBJzPrbL0>
X-ME-Received: <xmr:Y7TlaK0gJSw18RlZ6M-9dgTyi4gMM8K24IVnFtXK-okvIsgEI_PS5qjFFnu713E-_skH2cHwlago8gXU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddutdduledtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucgoteeftdduqddtudculdduhedmnecujfgurhephffvve
    fufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgrthcuufhomhgrrhhuuceo
    phgrthhsoheslhhikhgvfihhrghtvghvshdrihhoqeenucggtffrrghtthgvrhhnpefgue
    ejtedvieeltdeiieehvdethfeikedvgfeikeeghefftdehleduteevhefhteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtshhosehlih
    hkvgifhhgrthgvvhhsrdhiohdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepphgrthhsoheslhhikhgvfihhrghtvghvshdrihhopdhrtghpth
    htohepjhhushhtihhnshhtihhtthesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhi
    nhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepmhhorhgsohesghho
    ohhglhgvrdgtohhmpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehnihgtkhdruggvshgruhhlnhhivghrshdolhhkmhhlsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Y7TlaJFVXi0FoDtq1HgtCY0rtrivcmEsEPzaiPvFV9rXf8O_yCX6tw>
    <xmx:Y7TlaFEFejQtD1yIknuHW7-MuZMnbqQpxM_RCtjzqueXi2qsh2_42w>
    <xmx:Y7TlaM7pGlDxcmDeWfblg-tw4z50duYKeSrNfhJ8jwpoYe2qSiJHyQ>
    <xmx:Y7TlaKx1iv4v3J_hOkK2EMtQq-_jpFIjQC-rTNctaAg-fV2OW-kpjQ>
    <xmx:ZLTlaElG3r6YVHc4U99nTkw2Xc39X8Sib7EMSxsfrKCqnSj-Xt6XN2dM>
Feedback-ID: i7f194913:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Oct 2025 20:46:27 -0400 (EDT)
From: Pat Somaru <patso@likewhatevs.io>
To: patso@likewhatevs.io
Cc: justinstitt@google.com,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nsc@kernel.org
Subject: [PATCH v2] scripts/clang-tools: Handle included .c files in gen_compile_commands
Date: Tue,  7 Oct 2025 20:45:28 -0400
Message-ID: <20251008004615.2690081-1-patso@likewhatevs.io>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008003739.2659141-1-patso@likewhatevs.io>
References: <20251008003739.2659141-1-patso@likewhatevs.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gen_compile_commands.py script currently only creates entries for the
primary source files found in .cmd files, but some kernel source files
text-include others (i.e. kernel/sched/build_policy.c).

This prevents tools like clangd from working properly on text-includedd c
files, such as kernel/sched/ext.c because the generated compile_commands.json
does not have entries for them.

Extend process_line() to detect when a source file includes .c files, and
generate additional compile_commands.json entries for them. For included c
files, use the same compile flags as their parent and add their parents headers.

This enables lsp tools like clangd to work properly on files like
kernel/sched/ext.c

Signed-off-by: Pat Somaru <patso@likewhatevs.io>
Tested-by: Justin Stitt <justinstitt@google.com>
---
 scripts/clang-tools/gen_compile_commands.py | 135 +++++++++++++++++++-
 1 file changed, 128 insertions(+), 7 deletions(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 96e6e46ad1a70..6f4afa92a4665 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -21,6 +21,12 @@ _DEFAULT_LOG_LEVEL = 'WARNING'
 _FILENAME_PATTERN = r'^\..*\.cmd$'
 _LINE_PATTERN = r'^(saved)?cmd_[^ ]*\.o := (?P<command_prefix>.* )(?P<file_path>[^ ]*\.[cS]) *(;|$)'
 _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
+
+# Pre-compiled regexes for better performance
+_INCLUDE_PATTERN = re.compile(r'^\s*#\s*include\s*[<"]([^>"]*)[>"]')
+_C_INCLUDE_PATTERN = re.compile(r'^\s*#\s*include\s*"([^"]*\.c)"\s*$')
+_FILENAME_MATCHER = re.compile(_FILENAME_PATTERN)
+
 # The tools/ directory adopts a different build system, and produces .cmd
 # files in a different format. Do not support it.
 _EXCLUDE_DIRS = ['.git', 'Documentation', 'include', 'tools']
@@ -82,7 +88,6 @@ def cmdfiles_in_dir(directory):
         The path to a .cmd file.
     """
 
-    filename_matcher = re.compile(_FILENAME_PATTERN)
     exclude_dirs = [ os.path.join(directory, d) for d in _EXCLUDE_DIRS ]
 
     for dirpath, dirnames, filenames in os.walk(directory, topdown=True):
@@ -92,7 +97,7 @@ def cmdfiles_in_dir(directory):
             continue
 
         for filename in filenames:
-            if filename_matcher.match(filename):
+            if _FILENAME_MATCHER.match(filename):
                 yield os.path.join(dirpath, filename)
 
 
@@ -149,8 +154,87 @@ def cmdfiles_for_modorder(modorder):
                     yield to_cmdfile(mod_line.rstrip())
 
 
+def extract_includes_from_file(source_file, root_directory):
+    """Extract #include statements from a C file.
+
+    Args:
+        source_file: Path to the source .c file to analyze
+        root_directory: Root directory for resolving relative paths
+
+    Returns:
+        List of header files that should be included (without quotes/brackets)
+    """
+    includes = []
+    if not os.path.exists(source_file):
+        return includes
+
+    try:
+        with open(source_file, 'r') as f:
+            for line in f:
+                line = line.strip()
+                # Look for #include statements.
+                # Match both #include "header.h" and #include <header.h>.
+                match = _INCLUDE_PATTERN.match(line)
+                if match:
+                    header = match.group(1)
+                    # Skip including other .c files to avoid circular includes.
+                    if not header.endswith('.c'):
+                        # For relative includes (quoted), resolve path relative to source file.
+                        if '"' in line:
+                            src_dir = os.path.dirname(source_file)
+                            header_path = os.path.join(src_dir, header)
+                            if os.path.exists(header_path):
+                                rel_header = os.path.relpath(header_path, root_directory)
+                                includes.append(rel_header)
+                            else:
+                                includes.append(header)
+                        else:
+                            # System include like <linux/sched.h>.
+                            includes.append(header)
+    except IOError:
+        pass
+
+    return includes
+
+
+def find_included_c_files(source_file, root_directory):
+    """Find .c files that are included by the given source file.
+
+    Args:
+        source_file: Path to the source .c file
+        root_directory: Root directory for resolving relative paths
+
+    Yields:
+        Full paths to included .c files
+    """
+    if not os.path.exists(source_file):
+        return
+
+    try:
+        with open(source_file, 'r') as f:
+            for line in f:
+                line = line.strip()
+                # Look for #include "*.c" patterns.
+                match = _C_INCLUDE_PATTERN.match(line)
+                if match:
+                    included_file = match.group(1)
+                    # Handle relative paths.
+                    if not os.path.isabs(included_file):
+                        src_dir = os.path.dirname(source_file)
+                        included_file = os.path.join(src_dir, included_file)
+
+                    # Normalize the path.
+                    included_file = os.path.normpath(included_file)
+
+                    # Check if the file exists.
+                    if os.path.exists(included_file):
+                        yield included_file
+    except IOError:
+        pass
+
+
 def process_line(root_directory, command_prefix, file_path):
-    """Extracts information from a .cmd line and creates an entry from it.
+    """Extracts information from a .cmd line and creates entries from it.
 
     Args:
         root_directory: The directory that was searched for .cmd files. Usually
@@ -160,7 +244,8 @@ def process_line(root_directory, command_prefix, file_path):
             Usually relative to root_directory, but sometimes absolute.
 
     Returns:
-        An entry to append to compile_commands.
+        A list of entries to append to compile_commands (may include multiple
+        entries if the source file includes other .c files).
 
     Raises:
         ValueError: Could not find the extracted file based on file_path and
@@ -176,11 +261,47 @@ def process_line(root_directory, command_prefix, file_path):
     abs_path = os.path.realpath(os.path.join(root_directory, file_path))
     if not os.path.exists(abs_path):
         raise ValueError('File %s not found' % abs_path)
-    return {
+
+    entries = []
+
+    # Create entry for the main source file.
+    main_entry = {
         'directory': root_directory,
         'file': abs_path,
         'command': prefix + file_path,
     }
+    entries.append(main_entry)
+
+    # Find and create entries for included .c files.
+    for included_c_file in find_included_c_files(abs_path, root_directory):
+        # For included .c files, create a compilation command that:
+        # 1. Uses the same compilation flags as the parent file
+        # 2. But compiles the included file directly (not the parent)
+        # 3. Includes necessary headers from the parent file for proper macro resolution
+
+        # Convert absolute path to relative for the command.
+        rel_path = os.path.relpath(included_c_file, root_directory)
+
+        # Extract includes from the parent file to provide proper compilation context.
+        extra_includes = ''
+        try:
+            parent_includes = extract_includes_from_file(abs_path, root_directory)
+            if parent_includes:
+                extra_includes = ' ' + ' '.join('-include ' + inc for inc in parent_includes)
+        except IOError:
+            pass
+
+        included_entry = {
+            'directory': root_directory,
+            'file': included_c_file,
+            # Use the same compilation prefix but target the included file directly.
+            # Add extra headers for proper macro resolution.
+            'command': prefix + extra_includes + ' ' + rel_path,
+        }
+        entries.append(included_entry)
+        logging.debug('Added entry for included file: %s', included_c_file)
+
+    return entries
 
 
 def main():
@@ -213,9 +334,9 @@ def main():
                 result = line_matcher.match(f.readline())
                 if result:
                     try:
-                        entry = process_line(directory, result.group('command_prefix'),
+                        entries = process_line(directory, result.group('command_prefix'),
                                              result.group('file_path'))
-                        compile_commands.append(entry)
+                        compile_commands.extend(entries)
                     except ValueError as err:
                         logging.info('Could not add line from %s: %s',
                                      cmdfile, err)
-- 
2.51.0


