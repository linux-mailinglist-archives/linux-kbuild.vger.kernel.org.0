Return-Path: <linux-kbuild+bounces-13996-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aywSKwfbVGqxfwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13996-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2026 14:33:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 382F674AFAD
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2026 14:33:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OUNdwFPK;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13996-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13996-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7905B3012C5B
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2026 12:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C8E40B397;
	Mon, 13 Jul 2026 12:33:04 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7412C0294;
	Mon, 13 Jul 2026 12:33:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945984; cv=none; b=kQUSXa7tR1F43yklFeO82gsP8MogJ/kvJ/1zr2V3O3xebullgULkWOiQjGKudAwf7Kg02+KYB9YklksPQYxmDkwJF2Mhth21LA8TwuvHSv5JyJbTEYNgr9A0CCvPZG24rVyC9W9v/i4FvjNZvuQ9hCDan6SXJ8jJZXulE7szRa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945984; c=relaxed/simple;
	bh=ipCC0l8Uz5L8BTGCKa4kn2sLHTW+k9XIqYJWPwthA6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M264HqYfaWFL06ZVl6GsBq1TTdm0I5RBjtbvjuJsVIDP1S0xe/o73y8dStykZaRXes/CZAwYX0tSX7+X8geemGFjLAbHhqWdKWzVyuGZ0l8aYp+l68QWdyE+Xy/ZlpjztnNwXZhSuDUpKM9p6e7UlYIrNoAHdhcALFZPiNGOFrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUNdwFPK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id AB3331F00A3A;
	Mon, 13 Jul 2026 12:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783945980;
	bh=cEYktyZ9fZSzBsvhkeZ+hKsfvE7kNGcLa1hE7C8808k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OUNdwFPKMpvmwZJIR9XsVygvZBe21preJ4JewJyeqq3q14GYhQIV48P0L8Lo8JLg9
	 pJuyKe2WyDCtWQsy+wLYwSFJdFn7czH6Lc8sTNsjPhEWXL59G2IoiTiq9z7IPjB9V3
	 0q28T+uc4kG+HUI8VE+mew4fzcCTgGfZSBjlWiFy8T5cQB/z92qaEmtv+xGbBF8Z58
	 IrGrpTlyd0w1SX//iHzaSXGhZFPwr62vC+LNNbgeXMJa1U95fcYd26vepyblxJt4kN
	 ZFHW1qXgr046Dto3yfybiOuHv4q9OIYDiybOI0PKrrK29Ii9yh7w/xH7t2ZVFKAWYX
	 sGVTOsUfSgahw==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Gustavo Luiz Duarte <gustavold@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scripts: kconfig: merge_config.sh: keep temp file in the output dir
Date: Mon, 13 Jul 2026 14:32:22 +0200
Message-ID: <178394586678.708262.8955428063406751539.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710-merge_config_output-v2-1-8be3de601612@gmail.com>
References: <20260710-merge_config_output-v2-1-8be3de601612@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,debian.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:leitao@debian.org,m:gustavold@gmail.com,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13996-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,merge_config.sh:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 382F674AFAD

On Fri, 10 Jul 2026 07:03:33 -0700, Gustavo Luiz Duarte wrote:
> merge_config.sh currently creates a temporary file in the current
> directory. Create it under $OUTPUT instead, which allows running the
> script against a read-only source tree.
> 
> The default behavior is unchanged: $OUTPUT is "." so the file stays in
> the cwd.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] scripts: kconfig: merge_config.sh: keep temp file in the output dir
      https://git.kernel.org/kbuild/c/8d905d34

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas


