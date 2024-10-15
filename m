Return-Path: <linux-kbuild+bounces-4123-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 610A199E8C6
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 14:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8F1F1F22B56
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 12:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F541F707E;
	Tue, 15 Oct 2024 12:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Cdpo1ZZi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1031F131C
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Oct 2024 12:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994119; cv=none; b=tmX5TwDgBp/SY06ZFpkSvy6iZChkw4HtlBu9/mJOMj7CEWhDgLFR6mwkOE1S2ordqw2vokIYcX53+loxa9CaO09oOIlNdQTlYioiWd2VcSEaSzsPmXqAIHoz6nuwx2wZKDsuGioLTnDwuEFKoV8ep/Z8bGSfgdizkp4yC8wVJfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994119; c=relaxed/simple;
	bh=wcco51v4ndssSUSTfxrKzKb6FGX+SH3xE5vfA2R4D9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoCDkZHu8bwajUCzQWa8wxQjfpEZ1+/ZItIih/oxbwfW3yKGZlawsfIXoQ51xgKnXjXGvHdg6F/lW8zs4DHF3mqmWT+R/Iecr2bMQSEVZgIHZmRfqPYkKRT4/tTXLKRny3iZuKWhrRoV5o3PfPxBRoBXjXxfckQSlIUSMMBxntQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Cdpo1ZZi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43116f8a3c9so60313875e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Oct 2024 05:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728994116; x=1729598916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jb5H3boBi96I8Ci/iktPPSQLPU64M18S3ob2HZhlQ4I=;
        b=Cdpo1ZZiqqsfIRKT8bPoq+q3OLzwBR3vB2ZYzIO4B1aL+queEdC56SKUPCigrGRYsL
         X7wJBfSXCfT0sSbz+Th0XL5j4CxkM47txTsJwlsOylmjtlyHY7E3XGBXbUq2E5I2ZdK0
         SoPoDTd2ihExFeXvVIiQMhUkDyXadEMOB+GVtGCW7n4WcKSVMaZjL0uwG4glIJyGbPWE
         Yp+gMmNO9MZkdgYFN9nZLQoYpOEI3hmrZjriQcwMUI7AcqMMSh95MZm13dZYDEGyVpyE
         f5eMwAg35CeXP7xBBbWapgRVEgHV5z6llcKUZLWQPTVjdwIfXbcNd6xifPTnFznPG1XR
         BhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728994116; x=1729598916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jb5H3boBi96I8Ci/iktPPSQLPU64M18S3ob2HZhlQ4I=;
        b=O9I19ID0ttU4j01uDxFytw+ga5RO09uK9UHeo8DcWVBc+RQt+abv6gyohhJASXVbtf
         tvGPaDUkd4Cv8Ln5TzD6QkkOsriuNXgcI/2lSAOWwg96g2UUerCTqWpU931rri26zRM/
         OArpK7igiGLMIRV38piWAFIGq/5pDva+Y/AkRckmRxsryrXTw6b0RAfz7FayPTGgpMW8
         bJFB4ewiWI8EI0jySeqEEx+DK8Pyl9+2cb61doq/J6kDJRwm2GDsBcCj7RMT3r6VF1eq
         6B9Fx1MTvtyKOSEr9Jy/fMUG8z+MXVL3YQnEJo4o2agd78WxsqUSbXLnUbe1WHKaxlSG
         Vc0A==
X-Forwarded-Encrypted: i=1; AJvYcCXKTzy8yaxbTLxB7rKtPc0SPOb2KVS3NOUTr6U4F0j7iwAA202/A8Wya5nSGlhXAYorhrWqn3d0Y6ZJbAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaYMqUy+KGKcn4pD5T8LipLP97Ar4QptwfeXUBYSLHUMoS4eMt
	ANHkS2S0oBAtmSIolRCfPACvymLYORxHHbKymiqkZtPg5FA7GQ/01IjsUCBmIoSiOiNITbu03+N
	x
X-Google-Smtp-Source: AGHT+IHTWs2V6srqDKoruyVn6m+lYkAUbIDhtTysf4cloX9kctqEwo1M8MrkOY8lvinjAcKVF03gXw==
X-Received: by 2002:a05:600c:3ba1:b0:42c:c401:6d6f with SMTP id 5b1f17b1804b1-431255e052amr140489625e9.16.1728994115314;
        Tue, 15 Oct 2024 05:08:35 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6b320asm16051135e9.33.2024.10.15.05.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 05:08:34 -0700 (PDT)
Date: Tue, 15 Oct 2024 14:08:33 +0200
From: Petr Mladek <pmladek@suse.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/2] Use dot prefixes for section names
Message-ID: <Zw5a-JH99HwxhoY3@pathway.suse.cz>
References: <20241014125703.2287936-4-ardb+git@google.com>
 <CAHk-=wit+BLbbLPYOdoODvUYcZX_Gv8o-H7_usyEoAVO1YSJdg@mail.gmail.com>
 <CAMj1kXFu=fABi+d=A5PL2yNx2b70toT9KtDfnvU=8mmUBHMutg@mail.gmail.com>
 <CAHk-=wjk3ynjomNvFN8jf9A1k=qSc=JFF591W00uXj-qqNUxPQ@mail.gmail.com>
 <CAMj1kXGtruDm81Yor8hrOnSj7-J1vKKB1c-H0ZAtyMG_mZgWMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGtruDm81Yor8hrOnSj7-J1vKKB1c-H0ZAtyMG_mZgWMg@mail.gmail.com>

On Mon 2024-10-14 20:19:32, Ard Biesheuvel wrote:
> On Mon, 14 Oct 2024 at 20:10, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Mon, 14 Oct 2024 at 10:44, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > We have this code in arch/x86/Makefile.postlink:
> > >
> > > quiet_cmd_strip_relocs = RSTRIP  $@
> > >       cmd_strip_relocs = \
> > >         $(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
> > >                    --remove-section='.rela.*' --remove-section='.rela__*' $@
> > >
> > > Of course, that could easily be fixed, I was just being cautious in
> > > case there is other, out-of-tree tooling for live patch or kexec etc
> > > that has similar assumptions wrt section names.
> >
> > I'd actually much rather just make strip_relocs not have that "." and
> > "__" pattern at all, and just say "we strip all sections that start
> > with '.rel'".
> >
> > And then we make the rule that we do *not* create sections named ".rel*".
> >
> > That seems like a much simpler rule, and would seem to simplify
> > strip_relocs too, which would just become
> >
> >         $(OBJCOPY) --remove-section='.rel*' $@
> >
> > (We seem to have three different copies of that complex pattern with
> > .rel vs .rela and "." vs "__" - it's in s390, riscv, and x86. So we'd
> > do that simplification in three places)
> >
> > IOW, I'd much rather make our section rules simpler rather than more complex.
> >
> > Of course, if there is some active and acute problem report with this
> > thing, we might not have that option, but in the absence of any
> > *known* issue with just simplifying things, I'd rather do that.
> >
> 
> I don't disagree with any of this. CC'ing folks working on live patch
> in case they have any insights.

The livepatching specific sections use the name pattern:

	.klp.rela.objname.section_name

They are generated by a post processing of the livepatch module.
The code is not upstream at the moment. It is implemented by
some out-of-tree tools which are used to build the livepatches.

More details can be found in
Documentation/livepatch/module-elf-format.rst

Best Regards,
Petr

