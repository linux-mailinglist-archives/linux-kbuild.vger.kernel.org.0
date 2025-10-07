Return-Path: <linux-kbuild+bounces-9024-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F0BC00AB
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 04:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 749914E194A
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 02:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264F42745E;
	Tue,  7 Oct 2025 02:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=likewhatevs.io header.i=@likewhatevs.io header.b="uHuh3TMt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vsS01HvI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7F534BA2A
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Oct 2025 02:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759805151; cv=none; b=S834eXNlA2hRn2+c4Yhqdxwzr2iBIjpmpoZGzNDmZ5LdRxyh5wksB5WIHFrFdIGJsHgNXJD7sax7TcLKTEx2V5cC84b6Iqzfel+NYHR/luF9w8S63/qMjLpPW/RfIo944AdpVPlnQWpefRY3ZBUEtFwIqBhvD5klwL90zZe7a7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759805151; c=relaxed/simple;
	bh=u31GA0YdFb4LpfLbxCvUYqFmSbnkpFhwUxPCJGRiYfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eB543mqXtcjTh/mkVIAdY+0gXMZh6Zxjx5of0+GZPQvNp77g0FisSYOcUVoxeiVFaefzrRDWbPwV5k/wy/0KgU5qs0E9gxknzc1rliXT+qGineQEReFU17DTXNDqZ8RFKY743oKiKqTSnRj5nIr7UqncjrWof6p6qdcJ2ns7TZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=likewhatevs.io; spf=pass smtp.mailfrom=likewhatevs.io; dkim=pass (2048-bit key) header.d=likewhatevs.io header.i=@likewhatevs.io header.b=uHuh3TMt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vsS01HvI; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=likewhatevs.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=likewhatevs.io
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 86E141D002AA;
	Mon,  6 Oct 2025 22:45:47 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 06 Oct 2025 22:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=likewhatevs.io;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1759805147; x=1759891547; bh=JCA99grpF+
	0HIjWPPVMh4eGCnuIYXBd6YSQVjdWIU4g=; b=uHuh3TMt5/8Tns232nt56z9V56
	pVpNkZuQPsSK2bf2bmgMrWrJxywqLUvyp9bwuhoGpO5MEVUB7NyEspYRmhzwyt9A
	F/kjIDGdLUHejjX5whBSrH4pXJTuQHZdFZ2/tZlK/1qudnYSCqjTbhyCmiDItLLs
	CsDtO8Lb+Z0cKgl9BPLcnz3bdOZkXukQtxqIGwj+CC72fUR7/PtwsA5TULXL6aCf
	OWztzIB/RoCzezmeQTewaVRu2TFeYYkS385F+L4pCGIbA3VFYfUHlS4VN91Bm2Hw
	XFey3Ba7lqQl7x9as/zkRBas22/yZ8YVYYSHiqdgnz6SwrTxsTjWlwue2Mew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1759805147; x=1759891547; bh=JCA99grpF+0HIjWPPVMh4eGCnuIYXBd6YSQ
	VjdWIU4g=; b=vsS01HvISRQFNbyiaarTCQL4M7H3FrLbSYKLu1M3yw+wP9D0EM8
	eelecDAzpUddlMBd485IVWuQd3ewhzd+ka6N27ppJnuugGxyDgTgPjIKVQmme9c1
	l9DPEnPGUuxosBi2s/WbWGj5BncWQhUHrkbalTvHEzbaO9k6uk4DSsxOiwyQ+aJ4
	6037aYOIMDnBdIckfir5lsEZ/v8RVp25t/2YC42yqXzVF/WFfIlHiniH9+TaeQdK
	DWweDRxy3+gwhWEvmbZ8WCWl2Hm35d7OKGSwJD0OSg9zNsCdF581/NHBsFOsiK3S
	9nfL3Kz0aKFIJG+OOC+KLuCUpCq8YyN01Yw==
X-ME-Sender: <xms:237kaJtVbXoERGPTmNaUdb6E6v9qystYidX_L1NQ_rhlxCw0djIS5w>
    <xme:237kaJ6sLGJtmMyDpwjSAgWLjZAb4LQqgFFTLJDsmitZ6eHJe0IXgcFC7-pjKvb0q
    SBOfsSKr4nHPAkBT5VaNYgk8J3EQ7VFlIchzcy9Aym9QlS0jRK_>
X-ME-Received: <xmr:237kaKJ7QUrdZHf7sKhanSGbnom99b0FZwEcPkj72m-abHaLWBvEbiQI8cHGAcO1d8sUhwaYJNlwO5RW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelledviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghtucfuohhmrghr
    uhcuoehprghtshhosehlihhkvgifhhgrthgvvhhsrdhioheqnecuggftrfgrthhtvghrnh
    epfeevieevieejgfeutedtjeelleeifedvtdekkeduudevteevuedtheffieeuhedunecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhsoh
    eslhhikhgvfihhrghtvghvshdrihhopdhnsggprhgtphhtthhopeefpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepphgrthhsoheslhhikhgvfihhrghtvghvshdrihho
X-ME-Proxy: <xmx:237kaJ6zF9Helaf3i18UhezbQAGrdJUdYDSdUwcqz1z9ASwHPuZUxA>
    <xmx:237kaNzpgFZFfkIsG-GtWFNHaA-XvbHnPTCu4U7lV0gTtQp9kDF28Q>
    <xmx:237kaNa7YBCpnGSEqrrPMFKOhSgMcJrj5eS0llkpt-Cj53JhF-csbQ>
    <xmx:237kaPRHDQ0p0y8f__2L9rL6MKeou7tPDZBlclYxugxZr-Ssoy66Xw>
    <xmx:237kaJKGH64q8cbkKQlha073xZSijAGL58Cxamt--EN6F28z7E8KQ09R>
Feedback-ID: i7f194913:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Oct 2025 22:45:46 -0400 (EDT)
From: Pat Somaru <patso@likewhatevs.io>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Pat Somaru <patso@likewhatevs.io>
Subject: [PATCH] scripts/clang-tools: Handle included .c files in gen_compile_commands
Date: Mon,  6 Oct 2025 22:45:27 -0400
Message-ID: <20251007024527.1439747-1-patso@likewhatevs.io>
X-Mailer: git-send-email 2.51.0
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

This prevents tools like clangd from working properly on text-included c
files, such as kernel/sched/ext.c because the generated compile_commands.json
does not have entries for them.

Extend process_line() to detect when a source file includes .c files, and
generate additional compile_commands.json entries for them. For included c
files, use the same compile flags as their parent and add their parents headers.

This enables lsp tools like clangd to work properly on files like
kernel/sched/ext.c

Signed-off-by: Pat Somaru <patso@likewhatevs.io>
---
 scripts/clang-tools/gen_compile_commands.py | 126 +++++++++++++++++++-
 1 file changed, 121 insertions(+), 5 deletions(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 96e6e46ad1a70..02791efdc06d0 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -149,8 +149,87 @@ def cmdfiles_for_modorder(modorder):
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
+                match = re.match(r'^\s*#\s*include\s*[<"]([^>"]*)[>"]', line)
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
+                match = re.match(r'^\s*#\s*include\s*"([^"]*\.c)"\s*$', line)
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
@@ -160,7 +239,8 @@ def process_line(root_directory, command_prefix, file_path):
             Usually relative to root_directory, but sometimes absolute.
 
     Returns:
-        An entry to append to compile_commands.
+        A list of entries to append to compile_commands (may include multiple
+        entries if the source file includes other .c files).
 
     Raises:
         ValueError: Could not find the extracted file based on file_path and
@@ -176,11 +256,47 @@ def process_line(root_directory, command_prefix, file_path):
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
@@ -213,9 +329,9 @@ def main():
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


