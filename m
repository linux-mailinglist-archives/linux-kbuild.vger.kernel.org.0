Return-Path: <linux-kbuild+bounces-10818-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HKrIBtxcmlpkwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10818-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 19:48:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B67E16CADF
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 19:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36225300E395
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 18:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848F3366824;
	Thu, 22 Jan 2026 18:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IRybq5W1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BC130C626
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 18:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769107473; cv=none; b=haG1PLLoEFDyNDqtmTiKVA2QNYJOsPsDsYXp/DYBgrS9YzuknLI0oHYGqklsDZ3GSomTiVA9m/wxBoFIx3nKhAiulFT0wq87WokEAQ7E94I/K6V3qUQuYZCBX9CFLncAfCpQW0oyJWdzXq3Z4dI3jD8Tq4f2M3PEwn8zh1ECghk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769107473; c=relaxed/simple;
	bh=2Q5H3gCdb3sgTUSU+NkDU2PD+VR5Ft6ZvZBr5ynRA0o=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fFR4aCQR8XA0k494RyALJdiYvWJVGH02ypUN7fTAOED4n/O2FEaHSOxj7wkN1vCwHKurIonnm21Yq5Ahg25c6DXJVK5oULqNul3K/zsyat9cH5VX2DO4JJQLSHObQYVkMVdAHwk+8QF6j8k8yaEIZIsyGOZcYn2zVqsGeQCfImc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IRybq5W1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4B9C116D0;
	Thu, 22 Jan 2026 18:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769107471;
	bh=2Q5H3gCdb3sgTUSU+NkDU2PD+VR5Ft6ZvZBr5ynRA0o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IRybq5W1SrzJTdDPHbLo1yipIiAGeH/Iwd8JtC3wIo0vbGdWt+tuDWTUqnuUo/p/r
	 ruvjJmwUEpitAAaEtjTllzlKoDrZyTd+gtVvbT/EMZbNV8xEjxgZrg05WM7qT3Wl65
	 1+WRBJxzG2AOclRXYLCJZPLq1wCzVmqXtwExKpG8=
Date: Thu, 22 Jan 2026 10:44:30 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Simone Rea <hheh47660@gmail.com>, "Gustavo A. R. Silva"
 <gustavo@embeddedor.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] Makefile: Globally enable fall-through warning
Message-Id: <20260122104430.257b5d9f86275b37faed4757@linux-foundation.org>
In-Reply-To: <ad197140-3781-4098-9a73-4d9f49356409@infradead.org>
References: <20260122155401.335643-1-hheh47660@gmail.com>
	<ad197140-3781-4098-9a73-4d9f49356409@infradead.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10818-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FREEMAIL_CC(0.00)[gmail.com,embeddedor.com,socionext.com,markovi.net,chromium.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,socionext.com:email,linux-foundation.org:email,linux-foundation.org:dkim,linux-foundation.org:mid,markovi.net:email]
X-Rspamd-Queue-Id: B67E16CADF
X-Rspamd-Action: no action

On Thu, 22 Jan 2026 10:19:56 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:

> On 1/22/26 7:53 AM, Simone Rea wrote:
> > From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> > 
> > Now that all the fall-through warnings have been addressed in the
> > kernel, enable the fall-through warning globally.
> > 
> > Also, update the deprecated.rst file to include implicit fall-through
> > as 'deprecated' so people can be pointed to a single location for
> > justification.
> > 
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: linux-kbuild@vger.kernel.org
> > Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> 
> This is missing your Signed-off-by: line. See
> Documentation/process/submitting-patches.rst for info.
> 
> Also you should copy the current KBUILD maintainers.
> See the MAINTAINERS file.

This went into mainline in 2019 :) I suspect Gustavo had a slight IT
problem.

