Return-Path: <linux-kbuild+bounces-13906-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZQEZGxokQ2oQSAoAu9opvQ
	(envelope-from <linux-kbuild+bounces-13906-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 04:04:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C88336DFB2C
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 04:04:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nnasWku7;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13906-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13906-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4F7D3019FEF
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 02:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED3D2248BE;
	Tue, 30 Jun 2026 02:04:07 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD869191;
	Tue, 30 Jun 2026 02:04:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782785047; cv=none; b=jGy6ljVQnwGb4OxwgFbB5IM3HUoUJ5/p02M7yQ08rxfMXe6KSTX3e1KgJDErj02thLvVEvxQzd6hpfxP50LwlC92vHDNvpf2RJW4yMb1sMb5SkQXHOQDSh9wSBihqlEZoV4AFzP+56DxX8yaRPL3PhxRTLM2n8z9NZr1qmIQQsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782785047; c=relaxed/simple;
	bh=Fesctc61SRR4ThpBPahmuLjBixtyjJG2bvEcWEjM5fw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KdSn/mYHEzREg2wSRi8uya5l8k4x82coVuAErrf7BG9KDVI4e8quLCfW9LuVx/rmGu6gAvrfWj0CQNWln3ZJvcLPe+Nv25o7rK8JXigoctfJklgeBsDTWFkYfGnK+9y+Nk5XDsFS1p9GqSF7KxHuFQko6leA2ooFMUnIRRscjrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnasWku7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420251F000E9;
	Tue, 30 Jun 2026 02:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782785046;
	bh=Ur6+5jvW7yqb8z2JauyK6OwPY3Amvh8JH0f2YGep+kE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nnasWku7jqag2iaAYVhj1Yt1kzK72XuD/d30JG0yo08yf/FQ2RKt7DsOYkuemPyql
	 um52aVpd5fOmV5N2oZWDntpfVSemWOVisodJRplyc30Z4ShzLK3P9Xzxtd12z1quSK
	 B2Ulp2UyDJtjZgZ3wbzBpTh6AIb+LRFG3CH82Ekx/sC/Ew4mXxphKkpQ/ZfnrDgqsU
	 NAPGkjDHWYc/6+bfE4v9jHLykj41MJtirQoiHVMYgGagCaM2STTiLH0R63+K9h/I/e
	 H+Mlix8fm/JfjvTYWHP3LAGOg/V4y7kVr9UYzUeyI1EsxnMIOhKleAKnOtE1GxdYEo
	 gN/zAz0eVN6qQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/4] scripts: fix spelling mistakes
From: Nathan Chancellor <nathan@kernel.org>
To: Martin Weiss <martin.githubacc@gmail.com>
Cc: linux-kernel@vger.kernel.org, Martin Weiss <Martin.weiss2410@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Alexey Gladkov <legion@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, linux-kbuild@vger.kernel.org
In-Reply-To: <20260629082812.551273-1-Martin.weiss2410@gmail.com>
References: <20260629082812.551273-1-Martin.weiss2410@gmail.com>
Date: Mon, 29 Jun 2026 19:03:52 -0700
Message-Id: <178278503295.3414597.965604791088936644.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=870; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Fesctc61SRR4ThpBPahmuLjBixtyjJG2bvEcWEjM5fw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnOKsIbqpefDv6UrKL6sVHKhW8uH8+fuHDOdRqqVT/Cw
 rf6RG3tKGVhEONikBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABPhy2JkWHZ3Q4OuxE+bVZuD
 OhWFP/WHnLmas+R968bvvuvZf9fNZ2L4n3JX+urnnx9yD3z7Zu53uSl9z9kfOufdpVm2RK6eMLl
 pLy8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:martin.githubacc@gmail.com,m:linux-kernel@vger.kernel.org,m:Martin.weiss2410@gmail.com,m:nathan@kernel.org,m:nsc@kernel.org,m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:ardb@kernel.org,m:legion@kernel.org,m:jpoimboe@kernel.org,m:rostedt@goodmis.org,m:linux-kbuild@vger.kernel.org,m:martingithubacc@gmail.com,m:Martinweiss2410@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13906-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,linux.dev,goodmis.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C88336DFB2C

On Mon, 29 Jun 2026 15:28:06 +0700, Martin Weiss <martin.githubacc@gmail.com> wrote:

Hi Martin,

>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index f99e196abeea..c8f27e4175f9 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -38,7 +38,7 @@ is_enabled() {
>  }
>  
>  # Nice output in kbuild format
> -# Will be supressed by "make -s"
> +# Will be suppressed by "make -s"
>  info()
>  {
>  	printf "  %-7s %s\n" "${1}" "${2}"

Please always include a commit message, even if it is something as
simple as "there are two minor typographical issues in a couple of
scripts under scripts/, fix them", as some maintainers will require it.
I don't think it that big of a deal in this case but just something to
keep in mind.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan


