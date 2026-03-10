Return-Path: <linux-kbuild+bounces-11765-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDnWBxvsr2nkdAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11765-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 11:02:03 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1812249009
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 11:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C0633047BE9
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 10:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207391C8603;
	Tue, 10 Mar 2026 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wnFzpGUT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1863314D2
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136888; cv=none; b=MHGowP98PFnMBEbDqV0N2GS6yGReiOH2xOpg/jfzMiuYjt6Kh6mYw6yOyO/8ZLY4/K2bmwH9YY08pX8TcYKAz8V6qkogDtVVq9A/FcKklBabgJvMolcEOAbcc4LRUzGY/iv+4/XrIJQ0TNVw03++1reQ4RYntYA8FZdN032ZwX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136888; c=relaxed/simple;
	bh=Urwk7x4TITggfD1JqD5XD6o7yzS3Pil0oE2seibVOnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rno/UfOfqEzmZMcoG8iM24SioCD8gw8BQj/UgfsB62mQMvQri1wb055dr0WYXntivgFqX75qptFGp9Xez2OrU+GiOCOg8k4byRW75wmm46QJcyD/kbuY53qjscK/lfNyvGQUC3KX82kJAgLt7FoHEB9GgbrQAe8FPTcCfFD522M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wnFzpGUT; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59de8155501so7147416e87.3
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 03:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773136885; x=1773741685; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ac/UQiG4Lk57r2LyCgOQ4I3DQTnWytHe+MjruKr6HsQ=;
        b=wnFzpGUTlqBx1hDDs6IR9p4s1jp/mcuKPIKLT22uuj9G54nNB2cjTPDfby72v/LTgP
         Dd95judhf+c0estbPQvzlTmkES9H4y34yjWV8v5tuRjgvKVv//a4OvGHYmJlNO6jra6E
         RoE3XrCrv7yf1HlMYPamiCC4PIlaOAel0HBkTUQayBzK9fiemiw5S1wQHzHG5tYHwa0e
         noiKfM1FmPLQ22wr3D54xkYmNw0DtwcEIdcRtWg51Evxc9bdXlopW7k8+wnPGnefGvrO
         UYDhONTF4OAGF+IYW6IPn0TCdd1sqFcFzwNM/+lhrNYwYMWUrjyy9Yu3FZxmsYYHbe2E
         L96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136885; x=1773741685;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ac/UQiG4Lk57r2LyCgOQ4I3DQTnWytHe+MjruKr6HsQ=;
        b=BGzGAYlRgZszleDnnLqw7aj/Sg+ltfcxib6kmPezfhkXnkbApUYqlDOiyFKLWbCpgb
         trUeBTMgVJRYrttoH43LBzoLQOVx7jvWMpZHupaBpzoYLvDxyvYYOkumThAFDnL6RLRm
         3YwqSpJ/CIruoQ6/6RPhYPwGGscAiMr6VjKLl4Y/BrYJORlYWa0V7QghupumEMkrzCyq
         FGbBJB6EabEZCnBwSFiAsl9HQx7AgoZ6M/fwcnrNrhM2pwzuA6+r+MJ/hEL/18f5tMZv
         ol3hcjWR/kjKwLJJW2XAHE3572sVBJKe37snU7sSdMZT+bcXiygEGVu6HgyTgFIZhsgj
         mJVw==
X-Forwarded-Encrypted: i=1; AJvYcCWyvO1Ov/6O/08EHj2VOcznbs/BQdxjQqyf35E067RmdT8mHbUalFkbmKEw9gAXhW1RRXKgbqvQYxGTg3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGZ6OmJnl1a3D6sjNYQCsoXVtrnidWiacc/ySYEAJHXE556gDj
	8sp+ZWGqUA8ZTAjUR/i/LRcAFrRkzZNbM5iSm1PYpTJboIMCXHywyLEer82EVmVa+pIAR4csM49
	AdIuRjpk=
X-Gm-Gg: ATEYQzyh/mSlBGI1PGfQmiutP6qCHCix9Wyt09kM8ryv9dIT6Kz4Cr35xyvYWLFUaWl
	mc6aIJc9OsiY3CAALMjvuhkNqcoJzQaON/0Gwq+NXo6qDEb2I1YpWJLuvyGHsR9n0UCp0P0VqMC
	eiq2X1mQQZgqL2JPNHSfNP//Ejy7xLJAXIdNf/nfGEO4IZnOYpwGd2l1eAX0E69r4SaFlUynJrx
	Gu5JZHXJX0bRJr27E+DmpyvebbUmT04qTDKeM2SzrxwgMEidUetP/UvYBjD9efzJPuS0WesllQc
	yMGU9/haDuA48INBWwgLq3coro4a2TkUGfCklWeWyUAld7eyemLNz9VOdpxxvN0QpYvuX9QcGU8
	eqIxAgGrWy9SvKHZ+l7BW26FWx9H4RQkqDnORwego3pzitfqvdKJt0QTeHCcssbZvr1YJpS1BAK
	AR32ikpPi46SBamb1OHQIXn7UJaqYjJLIPVmQuAisg6uqAdcZLNMXQbKCo
X-Received: by 2002:a05:6512:230a:b0:5a1:2eaa:ac83 with SMTP id 2adb3069b0e04-5a13cd4b765mr4645749e87.43.1773136884381;
        Tue, 10 Mar 2026 03:01:24 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d737sm2675951e87.88.2026.03.10.03.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:01:24 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:01:22 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Andreas Larsson <andreas@gaisler.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] scripts: kconfig: merge_config.sh: refactor from
 shell/sed/grep to awk
Message-ID: <aa_r8kw7ClCnTvp9@nuoska>
References: <20260122105751.2186609-1-mikko.rapeli@linaro.org>
 <acb36651-449a-43e4-afe2-ba42a435cbb0@gaisler.com>
 <20260309170904.GA2779008@ax162>
 <aa_NWVOiHyN7CVvg@nuoska>
 <5e948d9f-dac3-4329-b7fe-e7f9a80108d9@gaisler.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e948d9f-dac3-4329-b7fe-e7f9a80108d9@gaisler.com>
X-Rspamd-Queue-Id: B1812249009
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11765-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[linaro.org:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikko.rapeli@linaro.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,merge_config.sh:url,linaro.org:dkim,linaro.org:email,gnu.org:url]
X-Rspamd-Action: no action

Hi,

On Tue, Mar 10, 2026 at 10:55:46AM +0100, Andreas Larsson wrote:
> On 2026-03-10 08:50, Mikko Rapeli wrote:
> > On Mon, Mar 09, 2026 at 10:09:04AM -0700, Nathan Chancellor wrote:
> >> On Mon, Mar 09, 2026 at 05:38:58PM +0100, Andreas Larsson wrote:
> >>> On 2026-01-22 11:57, Mikko Rapeli wrote:
> >>>> From: Anders Roxell <anders.roxell@linaro.org>
> >>>>
> >>>> merge_config.sh shell/sed/grep loop scales poorly and is slow.
> >>>> With Yocto genericarm64 kernel and around 190 config fragments
> >>>> the script takes more than 20 minutes to run on a fast build machine.
> >>>> Re-implementation with awk does the same job in 10 seconds.
> >>>> Using awk since it is likely available in the build environments
> >>>> and using perl, python etc would introduce more complex runtime
> >>>> dependencies. awk is good enough and lot better than shell/sed/grep.
> >>>>
> >>>> Output stays the same but changed execution time means that
> >>>> parallel job output may be ordered differently.
> >>>>
> >>>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> >>>> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> >>>> ---
> >>>>  scripts/kconfig/merge_config.sh | 168 ++++++++++++++++++++++++--------
> >>>>  1 file changed, 128 insertions(+), 40 deletions(-)
> >>>
> >>> Hi,
> >>>
> >>> Commit 5fa9b82cbcfc ("scripts: kconfig: merge_config.sh: refactor from
> >>> shell/sed/grep to awk") breaks merge_config.sh for me:
> >>>
> >>> ---------->%----------
> >>> $ make tiny.config
> >>>   HOSTCC  scripts/basic/fixdep
> >>>   HOSTCC  scripts/kconfig/conf.o
> >>>   HOSTCC  scripts/kconfig/confdata.o
> >>>   HOSTCC  scripts/kconfig/expr.o
> >>>   LEX     scripts/kconfig/lexer.lex.c
> >>>   YACC    scripts/kconfig/parser.tab.[ch]
> >>>   HOSTCC  scripts/kconfig/lexer.lex.o
> >>>   HOSTCC  scripts/kconfig/menu.o
> >>>   HOSTCC  scripts/kconfig/parser.tab.o
> >>>   HOSTCC  scripts/kconfig/preprocess.o
> >>>   HOSTCC  scripts/kconfig/symbol.o
> >>>   HOSTCC  scripts/kconfig/util.o
> >>>   HOSTLD  scripts/kconfig/conf
> >>> The base file '.config' does not exist. Creating one...
> >>> Using .config as base
> >>> Merging ./kernel/configs/tiny.config
> >>> awk: cannot open ./.tmp.config.U9SROCKTBj.new (No such file or directory)
> >>> mv: cannot stat './.tmp.config.U9SROCKTBj.new': No such file or directory
> >>> make[2]: *** [scripts/kconfig/Makefile:112: tiny.config] Error 1
> >>> make[1]: *** [<kernel-source-top-dir>/Makefile:744: tiny.config] Error 2
> >>> make: *** [Makefile:248: __sub-make] Error 2
> >>> ---------->%----------
> >>>
> >>> with this underlying call to merge_config.sh, an empty .config and where
> >>> my awk is GNU Awk 5.1.0:
> >>>
> >>> ---------->%----------
> >>> $ make tiny.config V=1
> >>> make --no-print-directory -C <kernel-source-top-dir> \
> >>> -f <kernel-source-top-dir>/Makefile tiny.config
> >>> make -f ./scripts/Makefile.build obj=scripts/basic
> >>> make -f ./scripts/Makefile.build obj=scripts/kconfig tiny.config
> >>> # cmd_merge_fragments tiny.config
> >>>   ./scripts/kconfig/merge_config.sh -m .config ./kernel/configs/tiny.config ./arch/x86/configs/tiny.config
> >>> ...
> >>>
> >>> $ awk --version
> >>> GNU Awk 5.1.0, API: 3.0 (GNU MPFR 4.1.0, GNU MP 6.2.1)
> >>> ---------->%----------
> >>>
> >>> At 5fa9b82cbcfc~ things works as expected.
> > 
> > Hmm, all these steps work for me with GNU awk 5.1.0 so something else
> > is different here. On line 267 awk is given input file args
> > "$ORIG_MERGE_FILE" "$TMP_FILE" "$TMP_FILE.new" and it fails to
> > create the output file "$TMP_FILE.new" with >> and plain print statement.
> > 
> >> Hmmm, not sure how I have not seen this error myself since I test
> >> tiny.config but I can reproduce with a clean output directory. Something
> >> like this seems like a simple fix but the only instances of ARGV[3] in
> >> the awk script that I can see use '>>', which should create the file if
> >> it does not exist. Mikko, any ideas?
> >>
> >> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> >> index 735e1de450c6..070ecae87a1c 100755
> >> --- a/scripts/kconfig/merge_config.sh
> >> +++ b/scripts/kconfig/merge_config.sh
> >> @@ -123,6 +123,7 @@ fi
> >>  MERGE_LIST=$*
> >>  
> >>  TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
> >> +touch "$TMP_FILE.new"
> >>  
> >>  echo "Using $INITFILE as base"
> > 
> > This could help but I fail to understand why this would be needed. Why is awk
> > not able to create this file on line 256?
> > 
> > awk manual says:
> > 
> > https://www.gnu.org/software/gawk/manual/html_node/Redirection.html
> > 
> >     print items >> output-file
> > 
> >     This redirection prints the items into the preexisting output file named
> >     output-file. The difference between this and the single-‘>’ redirection
> >     is that the old contents (if any) of output-file are not erased. Instead,
> >     the awk output is appended to the file. If output-file does not exist,
> >     then it is created.
> 
> Awk is opening the file for reading and fails before any prints with >>
> to it, much like this one does:
> 
> $ awk 'FILENAME == "non-existent" {nextfile}' non-existent
> awk: fatal: cannot open file `non-existent' for reading: No such file or directory
> 
> $ strace awk 'FILENAME == "non-existent" {nextfile}' non-existent |& grep non-existent
> execve("/usr/bin/awk", ["awk", "FILENAME == \"non-existent\" {next"..., "non-existent"], 0x7ffd32bda2e8 /* 66 vars */) = 0
> openat(AT_FDCWD, "non-existent", O_RDONLY) = -1 ENOENT (No such file or directory)
> write(2, "cannot open file `non-existent' "..., 70cannot open file `non-existent' for reading: No such file or directory) = 70
> 
> 
> > And in all my testing this works. Which distro is this? Is something else like
> > file system setup in some way unusual?
> Ubuntu 22.04.5 and a regular ext4 file system.

Right, so some awk versions behave differently. For the record in my testing on
Ubuntu 22.04.5 LTS (Jammy Jellyfish) this script works :/

Can you try if the touch fix from Nathan works?

Cheers,

-Mikko

