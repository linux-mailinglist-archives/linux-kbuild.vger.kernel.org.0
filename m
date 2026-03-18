Return-Path: <linux-kbuild+bounces-12071-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLcnCi4Gu2kgeQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12071-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 21:08:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E792C25B7
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 21:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 179CF30236AE
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 20:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188803ED13A;
	Wed, 18 Mar 2026 20:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLbhoKld"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F3D33F8C2;
	Wed, 18 Mar 2026 20:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773864491; cv=none; b=lHr3IkbXNZFcSJ7GXAi5oukCJlICVeDT873RgvOwLC58ew23UY5zVOIhxTaWBQVKK9YIzlQs5QUu2FJor1zPli64dMT24MHADT6XMYCOjOT3NMdLIOLZp2XB8EzlJz9+aiG628oW0Pb5XFWAhVQYf8sfPNtWutmBAu4P7cnBoB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773864491; c=relaxed/simple;
	bh=oFjFGrp/esZ8mrvciN4umVzAs9EqGXgEnLGibvo1Xec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dqlkht93lUbj7qr2V+DPkyS6AnB+jDp9Onr4ObD1UMx4XlH+WzShyY8Hfu/0uwSKVXhIXaDTD10mtDLwrufX+s/SY2AD61XvN1mfldaUO/RXRlermyKXh1HR5gRAOMTzt4UQsI6Al54+ZP3Y0y1NV7YdD5q4bIUci3YEJdt3rPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLbhoKld; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8843C19421;
	Wed, 18 Mar 2026 20:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773864490;
	bh=oFjFGrp/esZ8mrvciN4umVzAs9EqGXgEnLGibvo1Xec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OLbhoKld5EG0WQUP4Bix883xbMAfPtjVNZMdWabZk4HCSgFdRzwey6vh2B9ys91hF
	 MJgBTX8D5Xrylyli8UgdYHZOM6iy9K7kM1Rrn3c5IY75uSP3Hx2OJhgf+Ov08QTDA1
	 /ZU9WJwK6NJ9Ei/CXrtqiKpBb8SBjRQJdflWClTR7sIvNSHDYgjGDOU01GDPQLh+Vb
	 NOvzYQtNRU0i3HYRxecC6pnAtMA643OUEtFEplgfIEnSnBSQMYku2oOdBHHTdK3h/A
	 AB4rnig0nCPTpGC2BBIAgWqNupc+vGfOTXc8wjv8mH2glL6zmRWLLBjF+XTivcEVpP
	 FlOPatrcxa6ag==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: reduce output spam when building out of tree
Date: Wed, 18 Mar 2026 21:08:02 +0100
Message-ID: <177386442488.14799.13336212040689269302.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305-kbuild-makefile-spam-v1-1-910f6cf218a1@linutronix.de>
References: <20260305-kbuild-makefile-spam-v1-1-910f6cf218a1@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12071-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8E792C25B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 05 Mar 2026 13:04:07 +0100, Thomas Weißschuh wrote:
> The execution of $(call cmd,makefile) will print 'GEN Makefile' on each
> build, even if the Makefile is not effectively changed.
> 
> Use a filechk command instead, so a message is only printed on changes.
> 
> The Makefile is now created even if the build is aborted due to an
> unclean working tree. That should not make a difference in practice.
> 
> [...]

Sorry for the delay, this thread slipped into my spam folder ...

but finally: Applied to kbuild/kbuild-next.git (kbuild-next-unstable), thanks!

[1/1] kbuild: reduce output spam when building out of tree
      https://git.kernel.org/kbuild/c/c9bb03ac

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas


