Return-Path: <linux-kbuild+bounces-11029-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFGBDpobg2l/hwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11029-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 11:12:42 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B5EE4505
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 11:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18C623008D65
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 10:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACA13D649E;
	Wed,  4 Feb 2026 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="El2K5lZo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550723D3CF1;
	Wed,  4 Feb 2026 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770199959; cv=none; b=RFUNrcLioJ7LQ4BSFp7NyDU4uB4jW+8pwyyRYzmG3fhg36Z4IUuEnHHzdpr0yTBnqgmUzMsuMV9BdwHq6MWXgJuldzYkePkwrFDH4NCQF+SsWJLI92GrPQXeqtZeJzVShyGRzRwHbXkXqLPPqujHj9SJjShpdhbXB0dh7+sRzcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770199959; c=relaxed/simple;
	bh=inCyKiiNSNV6LDkRbFvq9oB6OngDmsXZ8tjL09HtSOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxmJg+uhqU052GY/YExYXb+tBk4Upj/Ct3gR1V7yg85ns8lHe1w0wBAY4vnYGp93tjJ89E/h4lqswceQ186G9zDUHtTaK6KGVwYmHDPDembj5HVNHdYtFy8AqMZxtQaepC0GMm4QJ8nFJZ0B5I8U/57jZ2W/+T4l8M3xWYQf5RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=El2K5lZo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8B2C4CEF7;
	Wed,  4 Feb 2026 10:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770199958;
	bh=inCyKiiNSNV6LDkRbFvq9oB6OngDmsXZ8tjL09HtSOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=El2K5lZoEYzGXPyiQxYUZbPxYCcUkUy2DeqOoMdeS2xmPuu6qi9yOlqaI/8W7uAtD
	 2r4LxKa8TICwGGNHb6rRIAaIkikOg/4N++mxnZGe/kW/4xy/ykNtOylncPllOgG/sN
	 aNuCBjJ7UgtK/mt52ZKlnlkZPq7NdXTUPjWI8sR3oZoIcZmziDPPIl2DO379SMXbtc
	 yzFcXxATivyof8t6/+RWy+1aGdUeq9qoAhW6XZWRDUqjU8QX28yG7pnORzwJo4h0HS
	 RsCBiQyw21eyk61UeiOGmTNKKRX0yhf5cgn9WnhFEmLwdPpcgWUNp3TuyGLQCxi8Rj
	 XabZ2/+NgFjtw==
Date: Wed, 4 Feb 2026 11:11:33 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Rong Zhang <i@rong.moe>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] kbuild: Do not run kernel-doc when building external
 modules
Message-ID: <aYMbVcNvJPlLPaaG@derry.ads.avm.de>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Rong Zhang <i@rong.moe>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260130-kbuild-skip-kernel-doc-extmod-v1-1-58443d60131a@kernel.org>
 <176987242178.1743608.5094531752561489739.b4-ty@kernel.org>
 <CAK7LNARR9bZQ9t9emcVzmL+P7xYemu=8s8v_LshQ0-m_zEE9mA@mail.gmail.com>
 <6387ba7b99fb952a59932c3a851dfd0ecc4dfb2c@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6387ba7b99fb952a59932c3a851dfd0ecc4dfb2c@intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11029-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,derry.ads.avm.de:mid]
X-Rspamd-Queue-Id: D4B5EE4505
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 11:10:37AM +0200, Jani Nikula wrote:
> On Wed, 04 Feb 2026, Masahiro Yamada <masahiroy@kernel.org> wrote:
> > Since kernel-doc is a part of Kbuild,
> > all dependent libraries should exist under scripts/.
> 
> Huh. I've always wondered why all the Kbuild makefiles are placed in
> scripts/, which appears to be a haphazard collection of, well, scripts
> and tools. But then you also have tools/.

From the kbuild perspective, as Masahiro mentioned, every tooling
related to kernel builds, kbuild or kconfig should be placed in
scripts/.  The tools/ subtree isn't using kbuild; rules, definitionas
and other expectations that are valid for kbuild may not be true in
tools/, cp. commit 6e6ef2da3a28f [1].

Unfortunately, there _are_ things in tools/ that are required for kernel
builds (e.g. objtool), but there is no consent on moving these parts out
of the tools/ subtree [2].

> I've followed the kernel-doc refactoring from the sidelines, commenting
> on some things, but it never crossed my mind the build shouldn't depend
> on something outside of scripts/. (That's what I'm inferring here
> anyway.) And apparently that thought didn't occur to a lot of other
> people either, with even more kernel experience than myself.

Yes, I also saw the changes fly by but did not think about the
implications.

> Sounds like the kernel config and build system would deserve a top-level
> directory like build/ or kbuild/, which collects everything needed for
> the build, nothing more, nothing less. Because scripts/ is not *that*.

Well, sounds straight forward at first, but where should we make the cut
between kbuild and non-kbuild?  I admit that there are some scripts
below scripts/ that I'd rather label as "contrib", but I don't think
that these are too much.

> I understand all of this may be a historical accident, and possibly too
> painful to fix now, but is any of this documented anywhere either?

No, I am afraid it isn't.

Kind regards,
Nicolas


[1]: https://git.kernel.org/kbuild/c/6e6ef2da3a28f
[2]: https://lore.kernel.org/linux-kbuild/1551764896-8453-3-git-send-email-yamada.masahiro@socionext.com/

