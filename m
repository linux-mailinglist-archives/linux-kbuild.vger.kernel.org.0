Return-Path: <linux-kbuild+bounces-12329-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHSbIc5Ux2lTVgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12329-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2026 05:10:54 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DABB634D3E3
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2026 05:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 064073022043
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2026 04:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD0533E374;
	Sat, 28 Mar 2026 04:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XgyTBxDE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555452BE641;
	Sat, 28 Mar 2026 04:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774670970; cv=none; b=qKxLlP83F2PHTWFhhkMFxW3hNwZEcZxWz9tAToZ29epHvy8PTGdRiC2w6wodzaf2vMTcxFc+uV1eGuIzQ5kxcIjcKoH1FbBbBRbGosGeyvrhh9MLuJsn9HeK9+8PSWgXQJoQxaXNSx7QW1WrFve0SqXT7pf+cgrp+usQ9w3ufhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774670970; c=relaxed/simple;
	bh=YbnAxwVquRkd0IPccdIqCrEKo9AdVwOXrSUh2GHxfA8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EVr9fYSXqGD1bT0EmF5H2yQA3s4qrlq0Iw29TH5E1stEeM+b/ktXLMilYvv5QrKV240790R2xRKGxV4boj4kw7traw7YigjmgI/EGcKiW6zL6vMCa08ZLGFztqIMar2j47PFLnt5qpdnUwQXpE10+MZv+0uid0IinM9IK5g/0yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XgyTBxDE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3BCC4CEF7;
	Sat, 28 Mar 2026 04:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774670969;
	bh=YbnAxwVquRkd0IPccdIqCrEKo9AdVwOXrSUh2GHxfA8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XgyTBxDEoKO0SHxGTO6tEMwJrAUfm1cm6W0dez8ATPQ8E6BC5JHp9rSkE8AqL6VdK
	 gjzCXES520ltPj0yzGcUsKCGXgXCzewsnHhsV8MF4Li/kEL95x+HqnX7egCwSvcaov
	 m04k4dZCUy5xwOo6nXPl7bp2zJWA0tbQOJhlgbtc=
Date: Fri, 27 Mar 2026 21:09:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Li Wang <liwang@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: tools/testing/selftests
Message-Id: <20260327210929.f3a714186aed347f90f71246@linux-foundation.org>
In-Reply-To: <acc49s7jbI9Q3a4f@redhat.com>
References: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
	<acc49s7jbI9Q3a4f@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12329-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DABB634D3E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 28 Mar 2026 10:12:06 +0800 Li Wang <liwang@redhat.com> wrote:

> On Fri, Mar 27, 2026 at 02:32:34PM -0700, Andrew Morton wrote:
> > 
> > whinges, perrmanits, maybe I'm doing it wrong, etc.
> > 
> > a)
> > 
> > At the top-level, neither `make mrproper' nor `make clean' remove the
> > executables from tools/testing/selftests/mm/.  Seems wrong?
> > 
> > b)
> > 
> > Shouldn't I be able to run
> > 
> > 	make selftests
> > 
> > from the top level?
> 
> Should use:
> 
>     make kselftest
>     make kselftest-clean

Thanks.

> Those two binaries (*_32 / *_64) are built by custom rules in mm/Makefile.
> (Makefile: line #218, #226).
> 
> Other tests use shared rules from ../lib.mk, which are quieter (they hide
> full commands and show short CC ... lines).
> 
> Maybe we need:
> 
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -215,7 +215,8 @@ ifeq ($(CAN_BUILD_I386),1)
>  $(BINARIES_32): CFLAGS += -m32 -mxsave
>  $(BINARIES_32): LDLIBS += -lrt -ldl -lm
>  $(BINARIES_32): $(OUTPUT)/%_32: %.c
> -       $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
> +       $(call msg,CC,,$@)
> +       $(Q)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
>  $(foreach t,$(VMTARGETS),$(eval $(call gen-target-rule-32,$(t))))
>  endif
> 
> @@ -223,7 +224,8 @@ ifeq ($(CAN_BUILD_X86_64),1)
>  $(BINARIES_64): CFLAGS += -m64 -mxsave
>  $(BINARIES_64): LDLIBS += -lrt -ldl
>  $(BINARIES_64): $(OUTPUT)/%_64: %.c
> -       $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
> +       $(call msg,CC,,$@)
> +       $(Q)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
>  $(foreach t,$(VMTARGETS),$(eval $(call gen-target-rule-64,$(t))))
>  endif

OK, minor thing of course.

> > d) within tools/testing/selftests/mm:
> > 
> > 	make clean
> > 	make -j100
> > 
> >    compiles 3-4 things then ends.
> > 
> >    A subsequent `make -j1' compiles nothing.
> 
> Sorry, I wan't able to reproduce it.
> Did you mean -j100 only build few source file but not the whole?

Yes.

On my 128 core machine everything up to -j50 works.  -j51 and higher do
this.

Another (32 core) machine runs -j100 successfully.

Weird.

