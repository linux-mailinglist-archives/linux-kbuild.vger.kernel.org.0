Return-Path: <linux-kbuild+bounces-12838-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NuhdAoMS5GnYQAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12838-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 01:23:47 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5045F422948
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 01:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEC27301DCF4
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 23:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360432C11CB;
	Sat, 18 Apr 2026 23:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWxZUm6X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F2D239E7D;
	Sat, 18 Apr 2026 23:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776554624; cv=none; b=QotxA3Mmom5wuFYItbxUxkyxwqP5/SwPmvwvXG77QLPc0cKNdzI2/Ibg7BnsDT3p5vqavzFx1iq30OiRaH5wb7HtD7AY60tDEa+JrBnS859/m7pqLsQjX4XAJNwnIye9XGtKSkM8zdIwlE+HDXd9h84deT1GBLOUZCL5qTDO9Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776554624; c=relaxed/simple;
	bh=EN4E/GrqbYdPOgLIBqgWr38ogwnBqfZGz13yZYWr8n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mocEQT8xa3liIGuT1UwKnr1AkO0rWdWklZPgw3TsusHaE3TiZ7x4tkmf7N66YqC8O77s8yWxvttN14qSmiCLtGk8k1lYHQtQRfN9qvv9vOi8byIlvDGZxshxjdkSFykuUeNGNsTpqJA9S19Lka0daPZibHPK64BVqp4jOXJmuUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWxZUm6X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E48CC19424;
	Sat, 18 Apr 2026 23:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776554623;
	bh=EN4E/GrqbYdPOgLIBqgWr38ogwnBqfZGz13yZYWr8n8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mWxZUm6XTycHh/nkgrMYCvZs1DWnZ4t+PwgeWrTlerO7gq64Xx50U6lgpyQlisvgs
	 rjkvIM5hfNir9rGSAghnYnSC7KOBc8GECMR84ppBRmhh+yheZYPd31Ri//N6CTChS+
	 hbHifpx29e4QakZUkXHPKJOB5ZWVEX7rMFfGrwzZCNWPomWfcbw7lpGG9uXKJkllwR
	 foAJKyy1Plv/Mig9O88N696UpfHNpLuR3h800RHbXaEHulN4L8W+8aBvs70XmZUbCb
	 J3Yxbzd7kPOs/FkoD1ft/pzimkeLhUIFPOuyx+G8i0OEc5HQHdXAaraaTms6cHq0Vp
	 o9MPZ5dLxke9Q==
Date: Sat, 18 Apr 2026 16:23:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: document generation of offset header files
Message-ID: <20260418232338.GA1729151@ax162>
References: <20260410221257.191517-1-piyushpatle228@gmail.com>
 <CAMB+xkY2judiZiTV7S1DpHuFdZg6WNzpNnn2k0zEUxXmxfBpnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMB+xkY2judiZiTV7S1DpHuFdZg6WNzpNnn2k0zEUxXmxfBpnw@mail.gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12838-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5045F422948
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Piyush,

On Sat, Apr 18, 2026 at 07:08:33PM +0530, Piyush Patle wrote:
> On Sat, Apr 11, 2026 at 3:43 AM Piyush Patle <piyushpatle228@gmail.com> wrote:
> >
> > Replace the placeholder reference with a description of how Kbuild
> > generates offset header files such as include/generated/asm-offsets.h.
> >
> > Remove the corresponding TODO entry now that this is documented.
> >
> > Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
...
> Gentle ping on this patch.
> 
> I’d appreciate any feedback whenever you get time, or let me know if I
> should resend/rework anything.

Thanks for the ping. This is still in my review/handling queue but given
that we are in the merge window for 7.1, I am not looking at 7.2
material until 7.1-rc1 is out.

Cheers,
Nathan

