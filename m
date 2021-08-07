Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D9F3E3509
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Aug 2021 13:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbhHGLCF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 7 Aug 2021 07:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbhHGLCF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Aug 2021 07:02:05 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27992C0613CF;
        Sat,  7 Aug 2021 04:01:48 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t9so23410400lfc.6;
        Sat, 07 Aug 2021 04:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GF2A7D7Zk08eDl8dLFG549xofD1EZev+abxefEqBVEw=;
        b=HCEBgbUxFbB1KcgmviugpP/S1ZZt3GMRnVeh73MH9QfAdSioCZykWJzuOcXOISDlsj
         UO17j5pVbd5vSwE2YSSkZAEJAfkCHZWU3F8BIL8JEjYoJznybCoU+BJ2T7+XLB/8TK9r
         GDugR+AQJEYZeZRk0sh7baCj24w5ttcmKoDNDOnqhvMz5XPOhjf88YPkJN4HIlz7u0MX
         sb5pwxWjui6dCPJn2R3yX2B6q3qcrcdgiFqtNRMe3BmSc2PgrKhQEquNgxyPM9siB0ce
         8Dc0vp5RAfoAEtHo1aom2u/WFUKVSIoM4C/vhdiJiXviTfz6gtd4rRJMdvLGTFTa4xQG
         38YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GF2A7D7Zk08eDl8dLFG549xofD1EZev+abxefEqBVEw=;
        b=cSCvPsPpGAecepFo6itj/AZEUnexMge3GV10UK/bxjLCQC5H3ZVl8YpUmeWNcVePcn
         rYhpO/++kh1WxYAx9/SMROe4eRT6DO1PBvT97d4BZ/Ot6xRb2hYcQPGXE13wTYFQ82kk
         LLh0A3obafF+Lg8Ws1ZPcAtrJqNcHiFzJG7xrpHGPce5NnEszLKAghRFPBjv3ql6KBSR
         yMJxvghpGOWvn0mpp3MUCsi+g9bRo8NJ5KT1oL+u5niHrpAwUqaRPDHTvzcoaIX1cUMY
         kJAs7QCOTerILq5fvqRY2gxY9RgGdmWIYR5HiBXUADka8QrehLKDEifwfwn7w/DFcYNO
         YmkA==
X-Gm-Message-State: AOAM532t1t6Ppgn4d+OdO/O/v1rfswlJYGac38451tIO+omZXjdVmth3
        PYTD5Vr0Ux/ms32jSkqsoaw=
X-Google-Smtp-Source: ABdhPJysNUNzuol5Gpd2yY5Y3ul8/ysOWTyVHD3gl08vogkJp6PzpLQAvLiQpfs+Ka2jOMDCc/x+Uw==
X-Received: by 2002:a05:6512:951:: with SMTP id u17mr11043648lft.392.1628334106522;
        Sat, 07 Aug 2021 04:01:46 -0700 (PDT)
Received: from 192.168.1.8 ([212.59.242.58])
        by smtp.gmail.com with ESMTPSA id x12sm1005396lji.117.2021.08.07.04.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 04:01:46 -0700 (PDT)
From:   Maciej Falkowski <maciej.falkowski9@gmail.com>
To:     natechancellor@gmail.com, ndesaulniers@google.com,
        masahiroy@kernel.org, michal.lkml@markovi.net, nhuck@google.com
Cc:     clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, maciej.falkowski9@gmail.com
Subject: [PATCH v2] clang-tools: Print information when clang-tidy tool is missing
Date:   Sat,  7 Aug 2021 13:01:16 +0200
Message-Id: <20210807110116.7985-1-maciej.falkowski9@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <CAK7LNAS=tyS22vk1mO7uCuzZ=YuzgByzC4Aix9JwugdV3xpr-Q@mail.gmail.com>
References: <CAK7LNAS=tyS22vk1mO7uCuzZ=YuzgByzC4Aix9JwugdV3xpr-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When clang-tidy tool is missing in the system, the FileNotFoundError
exception is raised in the program reporting a stack trace to the user:

$ ./scripts/clang-tools/run-clang-tools.py clang-tidy ./compile_commands.json
multiprocessing.pool.RemoteTraceback:
"""
Traceback (most recent call last):
  File "/usr/lib64/python3.8/multiprocessing/pool.py", line 125, in worker
    result = (True, func(*args, **kwds))
  File "/usr/lib64/python3.8/multiprocessing/pool.py", line 48, in mapstar
    return list(map(*args))
  File "./scripts/clang-tools/run-clang-tools.py", line 54, in run_analysis
    p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
  File "/usr/lib64/python3.8/subprocess.py", line 489, in run
    with Popen(*popenargs, **kwargs) as process:
  File "/usr/lib64/python3.8/subprocess.py", line 854, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
  File "/usr/lib64/python3.8/subprocess.py", line 1702, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
FileNotFoundError: [Errno 2] No such file or directory: 'clang-tidy'
"""

The patch adds more user-friendly information about missing tool:

$ ./scripts/clang-tools/run-clang-tools.py clang-tidy ./compile_commands.json
Command 'clang-tidy' is missing in the system

Signed-off-by: Maciej Falkowski <maciej.falkowski9@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1342
---
Hi Masahiro,

Thank you for your feedback!
I am sorry that I haven't replied for so long.

I agree with your point, based on this I would like
to propose a second version of the patch.

changes in v2:
 - Solution has changed from LBYL style to EAFP

Best regards,
Maciej Falkowski
---
 scripts/clang-tools/run-clang-tools.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index fa7655c7cec0..27ebe2f2069a 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -67,7 +67,14 @@ def main():
     # Read JSON data into the datastore variable
     with open(args.path, "r") as f:
         datastore = json.load(f)
-        pool.map(run_analysis, datastore)
+        try:
+            pool.map(run_analysis, datastore)
+        except FileNotFoundError as err:
+            if err.filename == 'clang-tidy':
+                print("Command 'clang-tidy' is missing in the system", file=sys.stderr)
+                sys.exit(127)
+            else:
+                raise err
 
 
 if __name__ == "__main__":
-- 
2.26.3

