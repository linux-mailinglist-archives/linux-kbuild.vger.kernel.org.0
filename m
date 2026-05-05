Return-Path: <linux-kbuild+bounces-13039-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PfLLTY3+mnHKwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13039-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 20:30:14 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 580DA4D2AB6
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 20:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6EF330E733D
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 18:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B314A3416;
	Tue,  5 May 2026 18:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXK5c2xU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32F44A2E27
	for <linux-kbuild@vger.kernel.org>; Tue,  5 May 2026 18:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005614; cv=pass; b=aNfP+1e4ca1zf8mN9rsi3EzV9ye5gVpYufrBrVWApy0ny7dqHucZ2LSZZlb0onRXKHcyKctzJYafySsc9C1p4HgU7HpJTqXb54I3bTE4GAbvzBCUHOfvEXekNzeIuggsvRwEZIBuOdG2Wyt2tCL8d9e898fTvcE8M4g8JTRGq5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005614; c=relaxed/simple;
	bh=ZIhgGw8OHp+7EafnrnJOBFkAUxEpp2cPLOL2P7jbZAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ppwCsooaOE5TL0tnP222CvWMvQoyoULLlJhCQs5Ykjp9O09KpifM2klubu4k+PwAdwYXz/wbc6PKtvWLTuw3QMOwHNlx82Ge+PTRvTUgtOq7y+tOhHsrGmHxvSe2TbI8/OA+uSE6NscwG9IvjXZrxBrIRZOBzTsc/PcxNUBW4VU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXK5c2xU; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7de4e6c5a30so4871122a34.0
        for <linux-kbuild@vger.kernel.org>; Tue, 05 May 2026 11:26:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778005612; cv=none;
        d=google.com; s=arc-20240605;
        b=WsAwUwNapAgOmYoerU3V4ydCOWAYv8C/ah/RdJDfL9/ZypsA+BCMG/cE4WXlPbaV5r
         //6r5LWx/uaejPA4CNDzc5Pac5wKStIUuG67pBzFl8XGNjlPI475jc9U3ZZqBWiF4LO8
         ojDHGrjhJ5+UO4P3MQGyFGORGij0dmanKEZ24XTjynx+NxKRLrvUH9ptE8rFl6aQWX74
         7jFsGMoJhIC8/n+Tk86PdbbpIZogL3YM7+58GX1TkJVSn9VYemkkevxNfZQhx9yg/YFX
         0GGnyE8wqVW0Ys7Mhg7Ohsu1GO+qAm9eut3AhK8Jrfv73Gtw2y1z9H1p0Ni/9oTIUca7
         AGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZIhgGw8OHp+7EafnrnJOBFkAUxEpp2cPLOL2P7jbZAs=;
        fh=mXR4M/sbDy9O1uiYjQJWkHw1AZ7DVnSdKQqVvhWhCdc=;
        b=MA6VehktdtYC2gV6sB5o8CgwTUc+CycXGaH0fyDkRU4OtWoHL7tVWDp1Z4D5Fy89N2
         uIBiOAwwcii99LcRZb5pOVu7USzxBZh7GT69c7yiGCTtXgWILb93r1icsYYizr8f1kMb
         tsDROEp7RQ1gUN7iGxXnfZwdgL8Ku6cMNPuhZ/evQCUHa2qmm4wQ48xZwviScJOfJuvg
         JX0sS97Wd7Mv1EGQmT7MOpr7d0h6T4KLt2VB1dCXHIhejLgpdIlrh+aeeB6q1dTsEXMa
         1C1emvZVe3SAEsRU+pFl/Dt8Uasp5pZGgb+Cc5EpXGAK/zRQZpD+s5Suvw+pDS32himY
         IDNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005612; x=1778610412; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIhgGw8OHp+7EafnrnJOBFkAUxEpp2cPLOL2P7jbZAs=;
        b=WXK5c2xUX1xo+RMVivqX3up4KZYapyVg+4+CPgNLKv63ds/ORhgCSMwLSBx2rG/Do5
         dpkAhlGcPr9IdslXL0+OqqNreGKliFBrzP1fRZVmJIDxIAUdSKdNbwYfV7J8psMOOR4N
         xStDo6EyPOCMDLD6ublGYL+36BAJkllVGYXeP2AUP9FQTfidkKoWSFop5XRqMGV//rL0
         OVplLAFdoW6jmN6MxOR3xpgjUSntqWsQaqq8/aULEt6ILQ6frNGMeBkkeh7Isnua6xW/
         fMhBk6Eox5daRjZcnuur93XcMiT+c4/AKgc//4nrTydmi5TDcDufZEUch4J95sLW2bhx
         /ZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005612; x=1778610412;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZIhgGw8OHp+7EafnrnJOBFkAUxEpp2cPLOL2P7jbZAs=;
        b=kTyiqXC0O8/eQsDuuoj0P9jiMDpu1WSiMCV22yTZZWDIiZt/h5jXdVGf4Pwbqf/nf6
         9mrDarepvRFYggN4PAlZBas4bkHHdNfL1IPkLDWuYKsfFhRZizmx41uxXMpyYvky8wYg
         ZTMEakf8eHp4HGDakGnCH4K9Mpxdhieg4c8QNOU2wTZOC36OcZnZR98kMLtGGutlouCu
         9cX8cRTuPIaTEopsXFp1FiYv4OiXySNPVjrBZjKCot8lXfIcA7AHdeePjy46+X3LZ+SK
         Jaqfh6rK2QmOJTtVYdzua9wIe0xtVzlqjiUskJQGlHAopzGRVC2bqjeD9MONdQ6dCVf1
         PIfw==
X-Forwarded-Encrypted: i=1; AFNElJ9h/lAnpliVBuBJGfxShfKYU8epOYgxSF33htWPxp6TO3O+1y1Hm6glvDScpG0D05RtJZ3lxdDd0n7+2Bs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzstr/qmExQAlAXU9A57iunDAMSH/aEiTH8gvilIWmhZlnwGmrC
	nZxC0cG2TulRbV74d2xHI2iAM7kGg+qwK4DCcqLcdh+i0QE6oNr/9Txox19fMilKfiKjfiibGhS
	1SgX9DSb9JzpQb2tg+ee13ykVVfmynB4=
X-Gm-Gg: AeBDievpqQovL5dqpAnEvmxqvJYdiGz/7K/qfNqh2AUJM6A4qxxwWgvUP3iI7LdRJtX
	epiu4m8+mh5AYvr58qiyquiLxtebHpI8UlbkymOQXM3nszsFusavPqh/o1O+QuXZ3e+Lrxl9iDT
	nNrVGCrAXItH4VJjcM8oTttozgmp8xF+uunwkEDdPjUhszpTp5Vhawl6WYVaZJw4NS8y1ZKXUHY
	oRYLZwUV99Degip40UxP7P80gi1ajLBEZmb2CsbtkXxNrf/vMZdHMpPNs0kd7VnN3ZfS/RH/fwv
	7h3IOmeGxb1/CRPo2LXlCkoduK8oDxjuEwrOLJ2UWt0eKhj9+Ctrel8ciW+vFehcJFZDl3jcV3O
	zWIYmNvag
X-Received: by 2002:a05:6820:4c17:b0:696:8b09:6c99 with SMTP id
 006d021491bc7-699980a957bmr426610eaf.5.1778005611625; Tue, 05 May 2026
 11:26:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-1-81d9b2e8ee75@kernel.org>
 <afoMRMnSQUwk1eaN@levanger>
In-Reply-To: <afoMRMnSQUwk1eaN@levanger>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 5 May 2026 15:26:40 -0300
X-Gm-Features: AVHnY4LyB1Xe5rlwokmTAGILipbZzP-_Kf8TGIx7tE8Zk3dE-DZnkJNK9pzsLsQ
Message-ID: <CAMAsx6cPfPVDBpL6wwHeqzWLqPwQB15pKgvgVu-Ni3Sjjkdf4w@mail.gmail.com>
Subject: Re: [PATCH 01/14] kbuild: Bump minimum version of LLVM for building
 the kernel to 17.0.1
To: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 580DA4D2AB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13039-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,lists.linux.dev,lwn.net,linuxfoundation.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielmaraboo@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Tue, May 5, 2026 at 1:11=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wrot=
e:
>
>> FTR: The translations
>>Documentation/translations/{it\_IT,pt\_BR}/process/changes.rst become now
>>even more outdated.
>
>>Acked-by: Nicolas Schier <nsc@kernel.org>
>

Hi Nicolas,

Just confirming that I will make the necessary corrections to the
changes.rst Portuguese translation (pt\_BR) in the next few days.

Thanks,

Daniel Pereira
Linux Kernel Maintainer pt\_BR

