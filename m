Return-Path: <linux-kbuild+bounces-12372-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDZTEd0Qy2lCDgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12372-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 02:10:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6187436293D
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 02:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB5B13014F66
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 00:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91C929405;
	Tue, 31 Mar 2026 00:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xsK3jEld"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC37F40DFA6;
	Tue, 31 Mar 2026 00:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774915795; cv=none; b=sDcpFOlZ08sDRQU3Hs/lU7R0w/G7jR+baIY/lwyi57e5Rarrr+oWUkTmY6hDGm6qU+NVI7vJ0k63GS24t6WZ2EnQKdfUvHsMTfhMOdcB8afSMzed6EtJCMJ7C95Lg3yCLgg/iLKp3RqqWitdefpIP3KaygB3Fm6pYxnEhnnmP9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774915795; c=relaxed/simple;
	bh=PcaDCU2JDyQM9eQ+xrbtwstL2Fn7RGIMSwfj615kpbc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Uh6cOdTfazBRM3noySvxfhfoMhTGAJbxTn/3ufVlsOm/FCpYnlKVf67TRrzfQWnqzg+iKO20c94tjv/lZuAJBVukbAIbCDFelQmPrLF9btTH2JvftK02kyKDiCTAJ3QSxRy7O8eoQb94WVjVAhOfNT+z3vjhq5VmSD4WLCtvUVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=xsK3jEld; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44596C4CEF7;
	Tue, 31 Mar 2026 00:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774915795;
	bh=PcaDCU2JDyQM9eQ+xrbtwstL2Fn7RGIMSwfj615kpbc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xsK3jEldpS8Km7fVin/zYc0Mtz/Wed9V/eGxqP1DQWoa++YAwubJImGElBImyGmtc
	 lekMbgnFPLo2XAPNGlWYTPKaY3b9vKOXjY4J6+MpB2sewptqJR0pWR2+ljowy5iFu0
	 5S81aqqXZAn4CMSxf3u6fBBbKo0NF3Um0KtW6rBA=
Date: Mon, 30 Mar 2026 17:09:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Li Wang <liwang@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: tools/testing/selftests
Message-Id: <20260330170954.47dfef29063afe9ea502505a@linux-foundation.org>
In-Reply-To: <acj5RK3lze7o704Y@redhat.com>
References: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
	<acc49s7jbI9Q3a4f@redhat.com>
	<20260328135650.435b415f8c00835b2fa471e0@linux-foundation.org>
	<20260328140311.d6ce99302f93923b0cffb441@linux-foundation.org>
	<acj5RK3lze7o704Y@redhat.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12372-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-foundation.org:dkim,linux-foundation.org:mid]
X-Rspamd-Queue-Id: 6187436293D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 29 Mar 2026 18:04:52 +0800 Li Wang <liwang@redhat.com> wrote:

> > ts:/usr/src/25> cat Makefile
> > # Automatically generated by /usr/src/25/Makefile: don't edit
> > export KBUILD_OUTPUT = .
> > export KBUILD_EXTMOD = /usr/src/25
> > export KBUILD_EXTMOD_OUTPUT = /usr/src/25
> > include /usr/src/25/Makefile
> > 
> > I've done this twice in succession now.  Any suggestions where I should
> > look?
> 
> When build selftests from the top-level, sub-makes entered via `-C` may
> still inherit the caller's PWD from the environment.
> 
> Some selftests use $(PWD) in recursive kbuild invocations, which can
> then incorrectly resolve to the kernel top directory instead of the
> current test directory.
> 
> Maybe try export PWD in the ../selftests/lib.mk?
> 
>   export PWD := $(CURDIR)

Thanks, I'll get onto this stuff soon.

Meanwhile, shouldn't this work?

ts:/usr/src/25/tools/testing/selftests/mm> make merge.i
make: *** No rule to make target 'merge.i'.  Stop.


