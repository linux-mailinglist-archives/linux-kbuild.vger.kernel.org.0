Return-Path: <linux-kbuild+bounces-13681-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9pMFOPlJKGqgBgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13681-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 19:14:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66961662D01
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 19:14:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=P3OIWRCa;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13681-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13681-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 444F73012309
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 17:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF4E49690A;
	Tue,  9 Jun 2026 17:08:07 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D01648B389;
	Tue,  9 Jun 2026 17:08:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024887; cv=none; b=CpvdGFFGUOj0nTI7R3oYHRjyh/MvHJRLh/eddl3CA7Ki69kPIs42xt8UhTqXTvp2izJdPaUY1qfcS4G9GqGRbPbIZLoQQSgzMEDYqsNS0tm1xCBozuoTdise7hrcKI2Z4oRcuGmwZJHKFlX+w/SnADJPWkiOkQvP326LAGvQ6EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024887; c=relaxed/simple;
	bh=TWticakF4lsCd+LJNURSo9PTN1fmU7xSrDoT1KoM52Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXmPcLdZzUJNyuwwFOJcAiaoxofCfuHt2MpGc+YI8wJ5ScDc1mNm+CuPAHtLl3yZ11XsXPADl1psrQXlg4y7h9fy6dy3vaZPoJ08jhDYJLv/lHPVeBcRAzEUqrGUIt86ufM6LnxkPMebd4PuA1earVWPPknlQ47+8Txoftr9R4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3OIWRCa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E363A1F00893;
	Tue,  9 Jun 2026 17:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781024886;
	bh=G07BoObhKste5pzhCvWzVieE17MhkuJWd46kgmO594g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P3OIWRCamIglcHyNYS7Hq+y8/uvM/ciIRhGSoC1tsT6yVDI2BOot/UzSenGbGR2xP
	 NYJjSqA0/pj9c0PiRwYOBvkYiLz1VX3SYQwoqXB3OwsAZWydsfw6kNAt4rpauDZeX4
	 ANazaxqo2Q7b/0bqymc4QVEMdAMFX+hV6qt5We/jO3QeItXR1RaOWXFpJkKrlgRO0v
	 udfab0Hk6eBoGvXy5YB53RS0CzF+gOJSR2gyVUlBuu9ex3ioa5MObsYxI5qrkr1rgt
	 td1WNhypQnecUW+GsU0SkiyvLuDpxuScFtCQhujN+5wGVDLlRTdDchZDc7OcrJrHif
	 bdP7faOZQCsBw==
Date: Tue, 9 Jun 2026 19:08:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Ping-Ke Shih <pkshih@realtek.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Sterba <dsterba@suse.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hariharan Basuthkar <quic_hbasuthk@quicinc.com>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Filipe Manana <fdmanana@suse.com>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, Wei Yang <richard.weiyang@gmail.com>, 
	Takashi Iwai <tiwai@suse.de>, Aurabindo Pillai <aurabindo.pillai@amd.com>, 
	Chih-Kang Chang <gary.chang@realtek.com>, David Lechner <dlechner@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Tamir Duberstein <tamird@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Aleksander Jan Bajkowski <olek2@wp.pl>, 
	Boris Burkov <boris@bur.io>, Blake Jones <blakejones@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v5 2/4] scripts/jobserver-exec: propagate child exit
 status
Message-ID: <20260609-cunning-aboriginal-moose-2da14d@quoll>
References: <cover.1779908995.git.daniel@makrotopia.org>
 <660368ca16e2d3845577a9fd157d2f37f0e09e85.1779908995.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <660368ca16e2d3845577a9fd157d2f37f0e09e85.1779908995.git.daniel@makrotopia.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel@makrotopia.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:saravanak@kernel.org,m:pkshih@realtek.com,m:andriy.shevchenko@linux.intel.com,m:dsterba@suse.com,m:bryan.odonoghue@linaro.org,m:quic_hbasuthk@quicinc.com,m:jeff.hugo@oss.qualcomm.com,m:fdmanana@suse.com,m:rtl8821cerfe2@gmail.com,m:richard.weiyang@gmail.com,m:tiwai@suse.de,m:aurabindo.pillai@amd.com,m:gary.chang@realtek.com,m:dlechner@baylibre.com,m:ojeda@kernel.org,m:gary@garyguo.net,m:tamird@kernel.org,m:linux@weissschuh.net,m:pagadala.yesu.anjaneyulu@intel.com,m:brgl@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:masahiroy@kernel.org,m:linux@roeck-us.net,m:olek2@wp.pl,m:boris@bur.io,m:blakejones@google.com,m:corbet@lwn.net,m:mchehab+huawei@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:richardweiyang@gmail.com,m:mchehab@kernel.org,s:lists@lfdr.
 de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13681-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,realtek.com,linux.intel.com,suse.com,linaro.org,quicinc.com,oss.qualcomm.com,gmail.com,suse.de,amd.com,baylibre.com,garyguo.net,weissschuh.net,intel.com,roeck-us.net,wp.pl,bur.io,google.com,lwn.net,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,dt,huawei];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,makrotopia.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66961662D01

On Wed, May 27, 2026 at 08:32:18PM +0100, Daniel Golle wrote:
> main() called JobserverExec().run() and discarded its return value,
> then the script exited with the implicit status 0. As a result, any
> Makefile that wired a build step through jobserver-exec saw the step
> silently succeed even when the wrapped command had failed.
> 
> Two in-tree callers were affected:
> 
>   Documentation/devicetree/bindings/Makefile
>     cmd_chk_style runs a python checker via jobserver-exec and uses
>     "&& touch $@ || true" so failures leave the stamp file untouched
>     and the next make rerun reports them again. The swallowed exit
>     code made the stamp file get created even on failure, caching the
>     failed run and hiding the reported issues until the inputs change.
> 
>   scripts/Makefile.vmlinux_o
>     cmd_gen_initcalls_lds runs scripts/generate_initcall_order.pl via
>     jobserver-exec; a perl failure was masked by the wrapper.
> 
> Return the subprocess exit code from main() and pass it to sys.exit()
> so the wrapped command's status reaches make.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v5: new patch; prereq for chk_style in 3/4 so style failures
>     leave the stamp file untouched instead of being cached
> 
>  scripts/jobserver-exec | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


