Return-Path: <linux-kbuild+bounces-12330-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELnxNRNCyGlFjAUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12330-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2026 22:03:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFD434FF6E
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2026 22:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1512530038E9
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2026 21:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5488933D6FA;
	Sat, 28 Mar 2026 21:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bFsA+8iz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F66149C6F;
	Sat, 28 Mar 2026 21:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774731792; cv=none; b=sW6QorYBqN41G1D85xi68drUsxklBm9wzs/bD61dj03s27gSQMQYWHVBhS8u2LvBNGkzo0uDQMQQ2n+tbG3W9cuShrgU11SB7mq2MO22Zb1c3tuBCQKmyRlY9uIliJQh4hTPgMlBXXc1B6zjMwoR6fH6hfABONmmZRtkbJv/K60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774731792; c=relaxed/simple;
	bh=fASIccO/WUQzqpPRgf4C+i8dkWYgpGQO3RZFoS2eejc=;
	h=Date:From:To:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=VHBSEgNgIBKfaYt/n72ErP5ioz550b/yruid+stWVmMVAqe+jo+6iIK7GtDN0mUw+uA+cusTVFpEpnnLHHHAhW6qwZycqHK5hZUli9TpzuYXdlRsBCnpZ5caNMzBksGSMstwT72w5Oao4g6sz2NaEJkiVGN82Eok4onsw3ki2BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bFsA+8iz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B24C4CEF7;
	Sat, 28 Mar 2026 21:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774731791;
	bh=fASIccO/WUQzqpPRgf4C+i8dkWYgpGQO3RZFoS2eejc=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=bFsA+8izQRCwFFsAbpkIAI12l0+fZIKBanlnqUpFcy6XbQIkBLE3Sh48QAMFvRwki
	 mLka7P/1zzsWx4qZnLUWwbvz4O5K9WlC3ufq8ktwxGjOZKxi3QFAorq9ls5PDHKabs
	 RuoWsZGIUi1k/yIj1U/jJPbs1kYzFidKMMFbxajQ=
Date: Sat, 28 Mar 2026 14:03:11 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Li Wang <liwang@redhat.com>, linux-kbuild@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: tools/testing/selftests
Message-Id: <20260328140311.d6ce99302f93923b0cffb441@linux-foundation.org>
In-Reply-To: <20260328135650.435b415f8c00835b2fa471e0@linux-foundation.org>
References: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
	<acc49s7jbI9Q3a4f@redhat.com>
	<20260328135650.435b415f8c00835b2fa471e0@linux-foundation.org>
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
	TAGGED_FROM(0.00)[bounces-12330-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,linux-foundation.org:email,linux-foundation.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3EFD434FF6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 28 Mar 2026 13:56:50 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Sat, 28 Mar 2026 10:12:06 +0800 Li Wang <liwang@redhat.com> wrote:
> 
> > > from the top level?
> > 
> > Should use:
> > 
> >     make kselftest
> 

I'm probably doing something wrong, but `make -j50 kselftest-all'
appears to have scribbled on my top-level Makefile, so now I'm getting

ts:/usr/src/25> make kselftest-all 
/usr/src/25/Makefile:5: *** Too many open files.  Stop.

ts:/usr/src/25> cat Makefile
# Automatically generated by /usr/src/25/Makefile: don't edit
export KBUILD_OUTPUT = .
export KBUILD_EXTMOD = /usr/src/25
export KBUILD_EXTMOD_OUTPUT = /usr/src/25
include /usr/src/25/Makefile

I've done this twice in succession now.  Any suggestions where I should
look?

