Return-Path: <linux-kbuild+bounces-8966-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 101C2BA67B9
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Sep 2025 06:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6A3A17E0E1
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Sep 2025 04:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B3C287272;
	Sun, 28 Sep 2025 04:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BB5NQwkD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFAE34BA3B
	for <linux-kbuild@vger.kernel.org>; Sun, 28 Sep 2025 04:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759033701; cv=none; b=VIexTBPOnj6nWJILWcGVqvB9TQR7PYGxXmITAzrYWSHg4vkZ9GGB0yo11QqEZt08l+qnZeD9+F4qe3rb0FeSXRW+7tMqNUyy0K4J6ykaOb3pls58XWIJwGDm1sbEXsbuUrQK37v+lpJN2tsP9nduT1mloUwirJZaCynFSwRiRM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759033701; c=relaxed/simple;
	bh=nuRR6zw90qB7SgrCrIDW+FhcmnpqZupfSWo58gy++mA=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=Yyfj/mSfRDEh/Sshcl89iJRSXQgzhtRZuvETWB0qO/p5MAdUShCBmO2VMZ2+CBZaEZXemLi0sAocc2AA7H2X/X/5jAgqACqtzoXMR2V9FVhYOjx9rhnVNtYnXXw4L0wDfdg4HqCDDMsxk9AZ88xAOMwD8+KMJlVTKBwUUl8J8Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BB5NQwkD; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d6051aeafso35291307b3.2
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Sep 2025 21:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759033699; x=1759638499; darn=vger.kernel.org;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6wp0fDq3k0/r9k12dCZGeSiwwlkTpuN3WtXOkQGhZJI=;
        b=BB5NQwkDMZSN41F4T2WEk/Alg/TPUCxuJ4OCW702TKm1XJF3a9T4u0ddtVvvW+8vJT
         Qbhgro6s9suOEXafR7DDNjY3LKB2G58fKeXaJ/8HBazT8dCTjR9zozIwubWKybRotmZ9
         WCQXIQpn9/HrHz2S/qeKpgCQOyout1+w5d6/xwh59cI9ZU4XlyDeL2w9oaMLB2XLx8CP
         3GYtKdseXI5iwZJQ4yH1p3Y5DUqMv8fY2GB9Sv3bgA6Z8KbrMUQAJ+36+Zc90ceY+myv
         FLLGouy2SWr6iph4yJ38mq1+F7CIUDk9gv5hB/JqebmekD1k99cPskS05D/JKfA8f5+e
         6F+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759033699; x=1759638499;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6wp0fDq3k0/r9k12dCZGeSiwwlkTpuN3WtXOkQGhZJI=;
        b=vKYYG+kUwsmdtKiRkp1aS26iqNJYcTIj6nGvBEEdvvc8E5sgd1UoGeh1OyughOjsy5
         F8WD2SHBWBTHr/GNCFB/G9riHzGEPuJymrUGFoapGq95GK7zJtrT75snme0V8i3VHMhk
         +tDmjy+Z7Wk7dJUcRwbiOVy800gL9cBrJskN9p95GauIcYmdl6efjWhD+selIn4itA3F
         jNlUY4KjCsefhxZdlJQ50kKVHcSZN/E3/gnz0mBE7M/4XmtEb8jRyk/vKUwEsUSdNF/r
         nMrWrW7FMif2S7lQLMc7nmU/4TIRyUe9Tu6CR3zI3e3ufAMphR+8iyI74X61Fl9riaBq
         4kZg==
X-Forwarded-Encrypted: i=1; AJvYcCXR6KXzpnjL2x4st3e3XT+YnwCIi3QMhJhLz/p8pFGUQu0SR1IGNMrDXBBMlDBEj5PDUNLnr/l0KlZdbqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGb1kqthaPcBmyEwIqFUqpFfwqThXGE/58DCXtmEFtmfZtFfZg
	B7No/UxUE8iz4rxg47JcnHmmIP4XJ16mj6CpiCMOjmYo62kywvRSP97lmOz+qX7+AA==
X-Gm-Gg: ASbGncsezXiEqBScKH6YZG7lUe5PQQQnVa2172cpiTkidPKzzLkVdUubnd5eBVn0T0t
	oFOD/SjkW73Akj345nHyXIWGTctV2AYFfqbGT1of2TWnNR9MGhO13N13HGyrFOOqzKbZ7PvRajv
	MxRfAb+hwW8+4JqVvuH4X+aYDwvzF+QDsOJq+4P865QY0Qx6HvrLGNLrjmqnDT2a/G57vLA5h6g
	GdWRbHPBERbyB7A3hI0kyzhrsXatnACRmLkw162Di7RjtibYnu3KW9H8GSoGiNzfF76VZo5aBBU
	fgxZC2QsXn1HMKaSBAIvYFv0fwtWDWGWwloa0ZQmG/xlMwuVR/T2E1vsZzWXlQ+pl+ka8q5dphr
	GsvsMP/t5gWl5rZR2y6MgTd4WoVmSbNMoKK58y9X+S7CIYbcL0xABa3rkSw0wrPzoQScw01JhVg
	jkofOCPoWaiuCuQNYWrJJ8YVTUqUKT
X-Google-Smtp-Source: AGHT+IEmjdyhyqxy5Fj/p/NzSZeWCCbu4ozrAL8XK6jcYUIhMH6CwQ6zd7Hg4Kbpnan97DOGis24Tg==
X-Received: by 2002:a05:690e:259c:b0:634:7613:25a4 with SMTP id 956f58d0204a3-6361a73c57emr9911004d50.14.1759033698815;
        Sat, 27 Sep 2025 21:28:18 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-eb383929c1bsm2473845276.19.2025.09.27.21.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 21:28:17 -0700 (PDT)
Date: Sat, 27 Sep 2025 21:28:06 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Nathan Chancellor <nathan@kernel.org>
cc: Alexey Gladkov <legion@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
    Stephen Rothwell <sfr@canb.auug.org.au>, Nicolas Shier <nsc@kernel.org>, 
    linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH next] modpost: Initialize builtin_modname to stop SIGSEGVs
Message-ID: <4590a243-0a7e-b7e6-e2d3-cd1b41a12237@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Segmentation fault ./scripts/mod/modpost -o vmlinux.symvers vmlinux.o
stops the kernel build.  It comes when write_vmlinux_export_c_file()
tries to buf_printf alias->builtin_modname.  malloc'ed memory is not
necessarily zeroed.  NULL new->builtin_modname before adding to aliases.

Fixes: 5ab23c7923a1 ("modpost: Create modalias for builtin modules")
Signed-off-by: Hugh Dickins <hughd@google.com>
---
 scripts/mod/file2alias.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 7da9735e7ab3..b3333560b95e 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -94,6 +94,7 @@ module_alias_printf(struct module *mod, bool append_wildcard,
 		}
 	}
 
+	new->builtin_modname = NULL;
 	list_add_tail(&new->node, &mod->aliases);
 }
 
-- 
2.48.2

