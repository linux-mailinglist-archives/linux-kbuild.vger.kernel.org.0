Return-Path: <linux-kbuild+bounces-13687-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sx8wMzCoKGqrHQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13687-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 01:56:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF9664DC5
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 01:56:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SYRV1IzM;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13687-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13687-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6ABA730C8675
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 23:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72323BE650;
	Tue,  9 Jun 2026 23:52:20 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BAA1C84BC;
	Tue,  9 Jun 2026 23:52:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781049140; cv=none; b=pJP1soVdgxyL47FuOFW1EKPuZ7GCazViYMOnb7BO8SJTaixPB1rrjWMBz8/3wBDDj5nwHr7bUIgenc8zC6JIgQ005ursCihJcQ7gqqpptZvztMYQRwi6QUhYi6to4TubHqMnNFEnZyPpWVr8Q2EYB7JiqFPgeMRmhfM9KE/2cvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781049140; c=relaxed/simple;
	bh=rIwg/16YzdWwva7l+nfPK0xfeJ0cIKDbVe/LMVyXpyw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CAwo66NqDeH3Za2ULZMFzMw6zevUKrmAkecXy8d/IDbItZkWVWgASYTPr2aXPqrQ4l42cGCVsEqQUm7x+8h+SMJ+YQPczCFpmajk0QwDyRgi/Znfe6REGYttibXRae/9qEchTd1kh6wRUvUP4Y/r5P+BN547VNWL5jIFbES/+Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYRV1IzM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF001F00893;
	Tue,  9 Jun 2026 23:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781049139;
	bh=qdEk7Oyy/Yx+aEB0vh55Y5jhk0ismJtQW1QkiROtBJc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SYRV1IzMwBinA1hbGZzv+jgOOcrXoJkZkQ722H0KYZn/mpJjl6BCnXnhESHhljCIP
	 ocVTBbd/oiYnxsl+WsdzBvK46omsnuEoH9dF3GU+lOy1+YfI+jvi+Ba7i9mF/rzsZV
	 HXnJhtUOeW9a357QJ1I3X60VjK45p2UNkpe4Y/vggqkCID1LpKVJdOxyGFpHT77Cj4
	 HSXLkJ5mPvKZSnjjSOM2bz3ow15D05vOrc6oSuWb1cR3QtAz4QsixcYmXFcMCMmuKt
	 lQm2cT6plSJfUIsYwkLHYPXmFDe2lKlbpmtne/RK6HTEO5clkWniZa11hZIkXLMAU/
	 pJfOKYm1WorYg==
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 James Lee <james@codeconstruct.com.au>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260604-dev-coverage-patch-v1-1-9f9368253cb4@codeconstruct.com.au>
References: <20260604-dev-coverage-patch-v1-1-9f9368253cb4@codeconstruct.com.au>
Subject: Re: [PATCH] modpost: Add __llvm_covfun and __llvm_covmap to
 section_white_list
Message-Id: <178104908935.2707941.7429097671960685644.b4-ty@b4>
Date: Tue, 09 Jun 2026 16:51:29 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=745; i=nathan@kernel.org;
 h=from:subject:message-id; bh=rIwg/16YzdWwva7l+nfPK0xfeJ0cIKDbVe/LMVyXpyw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkayw3fHH63NSL5t3xQ2THPLCc9N9WdHy+tZjrRsk6nw
 nY7v/WxjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRG3mMDBvefIp+d5zZ9nJ5
 VhHv5RjTlm+Gjmd6nSS9s1573WGSy2D4X7m0aYpEzWsulY3X/gscMlKyq1TZ5q+7qKIvOjpy7u4
 yfgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:masahiroy@kernel.org,m:nicolas.schier@linux.dev,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:james@codeconstruct.com.au,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,gmail.com,google.com,codeconstruct.com.au];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13687-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23AF9664DC5

On Thu, 04 Jun 2026 14:03:00 +0800, James Lee wrote:
> modpost: Add __llvm_covfun and __llvm_covmap to section_white_list

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] modpost: Add __llvm_covfun and __llvm_covmap to section_white_list
      https://git.kernel.org/kbuild/c/29c52907334a8

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



