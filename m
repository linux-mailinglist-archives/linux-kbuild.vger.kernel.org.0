Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2813BA86C
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Jul 2021 13:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhGCLYR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 3 Jul 2021 07:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhGCLYR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Jul 2021 07:24:17 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FD1C061762
        for <linux-kbuild@vger.kernel.org>; Sat,  3 Jul 2021 04:21:43 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id t3so16855724edc.7
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Jul 2021 04:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=mxv2fJNf5GElGh+cRMZi6AwpK4cz0NrOLSpwC9nEObY=;
        b=MVIu56qEjDv4KE6KsHzhscl4lxqB5RMwrrVg/HzZK/5AnkaythblN0IEhsoQ0e3GIq
         xDFp2+lFrn7vUoaNNePwQoW1XpQlNwo3asprCYEMSpebg48CQzJ0i9VaNWgqeRKAV+lK
         dPusd+yprwbdBrSl+yeLLONh/2sUitw6G15E6BK8iwsD5MhGblT1hf1jusmkW7mHD4Yh
         HlawQXG32uMXSiFU6a5SyVxDD0cEjHlfN8WJfSDRWo3vCQzdpT41r8sV2GVRCTWJHBVU
         wznBs8qYtll2hlgzE8WlB6ShfEtHLzGDR9+3O0Rwv1R6iUtawtcjPC9/SdDg5Ih4KYcR
         6UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=mxv2fJNf5GElGh+cRMZi6AwpK4cz0NrOLSpwC9nEObY=;
        b=IJotrFhtQZMID6Bi+Krk09xayoRBZLyWoSjQ8TBaxMMQdBClZvQTwgbhsrWCmCx8xG
         lNs2I9USS7beeLzVSZMwpv1/aWWsoB/c+5uaix/nU1gK9FNdwcUf5ffD6ca70VS68IRt
         i6wgxhtn40c3nh09bkKVnkCqB2sOnD7aD3B8waaSlCRaRzSNgDtzGYVYCg+hPrkEwbe5
         wbAMp3gt1IgP9/9P8aEiyLZ4jBcG5UO6RRS+S27TWR5LvKQiGWcTb8P3cGjwXGtjvQgW
         BW1gyPGaGuDWKnH4t1RocJxXR8iC2DzdClBZ3FMBn9+W09E0Wvl8wSPu6CynCl7N+0ke
         1D3A==
X-Gm-Message-State: AOAM530AFEeggAvSaAJM9Ea5T95LHa7tx7duMqE4SS4GHbzv4KBE/wG9
        C6KXmBkF/UVDkioJPHSLCw==
X-Google-Smtp-Source: ABdhPJwTVY3vUm8gSv8rvTgsW7LYxUnUZdUw4I5uLYlNKXNXrHe47ZuYH70LprRjByWjIK91YsbdMA==
X-Received: by 2002:a05:6402:781:: with SMTP id d1mr4895917edy.32.1625311302108;
        Sat, 03 Jul 2021 04:21:42 -0700 (PDT)
Received: from localhost.localdomain ([46.53.253.22])
        by smtp.gmail.com with ESMTPSA id c28sm2053816ejc.102.2021.07.03.04.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 04:21:41 -0700 (PDT)
Date:   Sat, 3 Jul 2021 14:21:40 +0300
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     masahiroy@kernel.org, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org
Subject: [PATCH] cc-can-link.sh: check for linking capability in a more
 robust way
Message-ID: <YOBIRA8oXQh4Antq@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Compiling "printf("");" doesn't necessarily check for linking capability
as printf can be optimised for constants strings even at -O0:

	0000000000401106 <main>:
	  401106:       push   rbp
	  401107:       mov    rbp,rsp
	  40110a:       mov    eax,0x0
	  40110f:       pop    rbp
	  401110:       ret

Pass something from the command line to disable optimisations:

	0000000000401126 <main>:
	  401126:       push   rbp
	  401127:       mov    rbp,rsp
	  40112a:       sub    rsp,0x10
	  40112e:       mov    DWORD PTR [rbp-0x4],edi
	  401131:       mov    QWORD PTR [rbp-0x10],rsi
	  401135:       mov    rax,QWORD PTR [rbp-0x10]
	  401139:       add    rax,0x8
	  40113d:       mov    rax,QWORD PTR [rax]
	  401140:       mov    rdi,rax
	  401143:       mov    eax,0x0
	  401148:  ***  call   401030 <printf@plt>
	  40114d:       mov    eax,0x0
	  401152:       leave
	  401153:       ret

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 scripts/cc-can-link.sh |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/scripts/cc-can-link.sh
+++ b/scripts/cc-can-link.sh
@@ -3,9 +3,9 @@
 
 cat << "END" | $@ -x c - -o /dev/null >/dev/null 2>&1
 #include <stdio.h>
-int main(void)
+int main(int argc, char *argv[])
 {
-	printf("");
+	printf(argv[1]);
 	return 0;
 }
 END
