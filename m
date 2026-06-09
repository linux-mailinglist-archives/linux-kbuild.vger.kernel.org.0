Return-Path: <linux-kbuild+bounces-13680-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nrm0Je5AKGpdBAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13680-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 18:35:58 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B03662710
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 18:35:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dtpgYK8H;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13680-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13680-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 109F4305663F
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 16:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60DF3B5850;
	Tue,  9 Jun 2026 16:19:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884543B635F;
	Tue,  9 Jun 2026 16:19:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021993; cv=none; b=a57oRLvoHzpSRp/lB/FUD9Hcqx311RziBDsqsQx/pMm676YJTv1mTo3wyKkUOCw5RZ8w6ZKYmiUrGSMuqLXIvw6C0AmenJWzxvXouxLPe+oOtMqAp5iI5VlA9nL+ELXGTjWt271pjwkNo+4B9lkT/LU+2RTZF4QCvIhmh9FSRBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021993; c=relaxed/simple;
	bh=j/TcUkAADk/ErOnVG4elqZ0QlOTbpBt/BsP3nJ8TlYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugQq6kuPfDJqPyzMjRHG6GcAGf8pKiEiCLsBnMs63I3O2rZZx5EqqvTYGnxhSb1cximCg/BLNkA+jIrkbpna00o70XxBsPSCT2onO3lElnWYVq8Ld67l3vOyvd4RxJLKyH7Y8u9zDL0qbY0zcG7kiW+7tLZ/DgmQwZJYXRceIyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtpgYK8H; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D137A1F00893;
	Tue,  9 Jun 2026 16:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781021991;
	bh=OwEVouHGm4j2bBK7dp3Q0GarnuDfIaAGqapIB+1/34I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dtpgYK8HOu48Rr7sxNw9QNxturYLrnJHo3Vs7u2wbJX27WEN1fslVQI1BUhVZktGL
	 BwvGaATv1aF3wrRLBGDReHhVFsApzyK2a/OMeZAqazYLxrYo3QCEVWult4N4NZghYc
	 h+QxAKa8gySA4yUENJ8wPm+6/Da6D+mIQ1KSLPAgjSQS9WtUhYq64en6+fZ5+bD7mJ
	 mMaMtVJZdvrMgyi9xfTLQVIexVtrHyCoV3wiULqKfZaQAvCHHRjykXQCA2q5QRjf2Q
	 bTJou7RwqplIZpJoanCLwekwvbim3/M147cEVOKSNi0R988UAYlMxSukeM32heVJmP
	 OoFhytEcc7H9g==
Date: Tue, 9 Jun 2026 18:19:47 +0200
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
Subject: Re: [PATCH v5 1/4] dt-bindings: add DTS style checker
Message-ID: <20260609-rebel-hummingbird-of-maturity-2325b1@quoll>
References: <cover.1779908995.git.daniel@makrotopia.org>
 <224923f3d1c73ff55cebb3e0796f119e32c1bb43.1779908995.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <224923f3d1c73ff55cebb3e0796f119e32c1bb43.1779908995.git.daniel@makrotopia.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-13680-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,makrotopia.org:email,qualcomm.com:email,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4B03662710

On Wed, May 27, 2026 at 08:32:10PM +0100, Daniel Golle wrote:
> Add a Python tool that checks DTS coding style on examples in YAML
> binding files and on .dts/.dtsi/.dtso source files. Rules are kept in
> a small declarative registry, each tagged 'relaxed' (default; must be
> zero-violation on the current tree) or 'strict' (opt-in for new
> submissions). Promoting a rule from strict to relaxed is a one-line
> edit once the tree is clean.
> 
> Relaxed mode covers trailing whitespace, tab characters in YAML
> examples, mixed tab+space indents, and missing tabs in .dts files.
> Strict adds indent unit and consistency checks, blank-line placement,
> sibling address ordering, "compatible" and "reg" ordering, and unused
> labels.
> 
> The tool reads file paths from @argfile and parallelises across CPUs
> via -j N. With no -j given it picks up $PARALLELISM (set by
> scripts/jobserver-exec from the GNU make jobserver) and falls back to
> os.cpu_count() otherwise. Running as one Python invocation amortises
> the ruamel.yaml import across the whole tree -- ~2s on a 32-CPU host
> vs ~28s sequential.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Probably by relying mostly on regex instead of proper token parsing we
will hit a wall at some point, but it's better than what I would write.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


