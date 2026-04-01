Return-Path: <linux-kbuild+bounces-12471-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Gx/HIQHzWl/ZgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12471-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 13:54:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D27379F04
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 13:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69E8E30F0872
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 11:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0673F99CF;
	Wed,  1 Apr 2026 11:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dtvdGYmX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A921378D63
	for <linux-kbuild@vger.kernel.org>; Wed,  1 Apr 2026 11:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043919; cv=none; b=DhL7/48e0aznENk2aV5bqzYU3EE9EfmDjuI/DpA41D7QrJVju1QHHXVzSrrTZ2hnX1SXcZIC48QQ8RohFGlWx/8nChgEf8XEUy7iEGW2g2+N/hJfa/8bWvj1D+SETpSIxPMY4t2A6xmVnema6vo8AbMv+rNxX1OvSSOrKHtyNUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043919; c=relaxed/simple;
	bh=1YQR4oYB827jWhblwTuayOmLSRnKLaKfpyTUg03CM7I=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=DHSHGznTYlvcegShmu4aQ4BVHMt4FbS37NqOOLUtShQTGq9DX1ob2nCX7fKFuYmp8sFFue1jsMaVi2OZesGUYz76s8/fmEunxd3TRziMK86Ww0nawR/1zwAk1v/twM2q0OIL+GQlablZwY38NDtWm4q68YJ+g5qRGwiN3DyFcQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dtvdGYmX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48541edecf9so81382135e9.1
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Apr 2026 04:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775043917; x=1775648717; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPqO66ooSzvYXcHovRc3kumo4Z4L11P3H0CO3iwizgE=;
        b=dtvdGYmXGaGve3LSX3VP8QqMMITzokNLUKzGpAmN+Ptl9Y+loyyXyiMW/3nKqpN3XT
         tgDPCF8sM59IoJ+bJ0ptVeEVccIZtvAaOF9+vimBGkRwcKs54lhSaTvp8Q5m1N9ocBhy
         OuGoJQsvwUXnFt7NTWALhrNgRwxaL7L3x5o3nAfSZroMkoZurp3vNZ7IX5B8AwN1SZxX
         39oMnGzhiQJ6HvxI+Fm0iPGFo0E9R45EGsnBc3hxp0ePCYCTLUDN5sOUjT7agxxAP8/k
         dZkmUgzP7BdrLkMs6pBt1RzKF738kWDchzOQhOrahsQayVhjbZSZi2Edb5JJdST9T1+V
         OfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043917; x=1775648717;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NPqO66ooSzvYXcHovRc3kumo4Z4L11P3H0CO3iwizgE=;
        b=dDdLbJ4G5iGkpGm06COJwTmVLi1vPVQQW6y7VgytlXsqPnrrZA+iUn8IhstLsjYwHD
         ey6p0kjBbM2sKzBKB+n/8IKK0NKjX9qI0jfWxtbSZrDCG0hqVARZYRKlKeQHOKgAjKYi
         fUfvipBgOzddHYBKLjdUV+ZJJPNvSt9V+YZY9e6wl7/urgNy6eoF8KA/mTNLmSc88JQM
         k/DNwZNj2wNTGjBFWVVrUn4TIbdY/bY3WlTNjNpoQQUc/WkFbOleL5QmPp0Dym/wGJ/T
         /GVMQjcBU/gjU3pMWgZ1etfiXvLdy2oUWSr70EkomQpBwgZL2J8tZU6Cglb92s3zjxSD
         OGSw==
X-Forwarded-Encrypted: i=1; AJvYcCXbECDxYfjnLBzfxRKFffu+l9zrFLex53A1AtqO0sGK/BzxSLSCM3DEupaKzUORuUYeEcmrfdI8iG6Qp9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIDC6ftCY6VHFBJAgVzDkJZQ2TNhsjl8NqqUrD3KgnCqrwTTHw
	YA4V/6+LsoKiEN+idQQwBHGJRevQvquOyUMk6aHa+p6oIAAf8p/LlzaYumwoicTZe8RE1GHt5+N
	iSEHN8HE=
X-Gm-Gg: ATEYQzwP3R2kMTh0j46Or0k5eBIZWuINZv2+SQGioqdpzy1Flj/QO5+qtSF+ide8f+m
	oSVJBM2oztudLSqkG8tzByeox9Ni1Ek9fq2EbzETlerwbzx6f0GhMraGLqs6YVtH5w9+/2pbBv6
	WT35GoJ13Ii9LlHW/HYVkwdMjUh720+D35vu71vagc4nlC+RhF6+RuI4zPwNNC31yQng5kfIqvX
	f/PB5GF9RbYDM0BPdZfmhqidJAnL1ew5tlw5f4uq/l3R2lmQkavP6Nr+0IEvNgUFTAzNMJ7IVwm
	r2X29THFavlxQDnhNGGnWJ1u7FAcSYFhfuE/PB/D+lMbRmoXvanB0VRGxqTF0sDzYDV0w77Oxbs
	w5q949w/+LUOQ2ZMX/WkCobC43K7yn74ycfr+cg7KbpgPangvKR2+nszaV3dua7p1iEIMpbYFO5
	yu9sDX64M=
X-Received: by 2002:a05:600c:5298:b0:488:7ff5:2c67 with SMTP id 5b1f17b1804b1-488835887f7mr57611785e9.12.1775043916610;
        Wed, 01 Apr 2026 04:45:16 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a7ba96sm15541462e0c.17.2026.04.01.04.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 08:45:13 -0300
Message-Id: <DHHSJWIDPYS1.332RJY2H7YNA2@suse.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Subject: Re: [PATCH 0/6] selftests: run_kselftest.sh cleanup and fixes
Cc: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
To: "Shuah Khan" <skhan@linuxfoundation.org>, "Shuah Khan"
 <shuah@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <b01d1156-2213-4051-9f98-60e74d18e2a6@linuxfoundation.org>
In-Reply-To: <b01d1156-2213-4051-9f98-60e74d18e2a6@linuxfoundation.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12471-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rbm@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D8D27379F04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 31, 2026 at 7:43 PM -03, Shuah Khan wrote:
> On 3/20/26 12:29, Ricardo B. Marli=C3=A8re wrote:
>> Hi Shuah,
>>=20
>> Please consider merging the following patches. They are mostly small fix=
es
>> to run_kselftest.sh, plus one feature: adding the option of passing a
>> directory to the "-p --per-test-log" argument.
>>=20
>> There is a small corner case spotted in tools/testing/selftests/Makefile
>> regarding failing sub-targets, and also the removal of the default insta=
ll
>> directory for out of tree builds in the top-level Makefile.
>>=20
>> Thank you!
>>=20
>> Signed-off-by: Ricardo B. Marli=C3=A8re <rbm@suse.com>
>> ---
>> Ricardo B. Marli=C3=A8re (6):
>>        selftests/run_kselftest.sh: Remove unused $ROOT
>>        selftests/run_kselftest.sh: Add missing quotes
>>        selftests/run_kselftest.sh: Resolve BASE_DIR with pwd -P
>>        selftests/run_kselftest.sh: Allow choosing per-test log directory
>>        selftests: Preserve subtarget failures in all/install
>>        kbuild: remove kselftest output in mrproper
>>=20
>>   Makefile                                    |  1 +
>>   tools/testing/selftests/Makefile            |  8 ++---
>>   tools/testing/selftests/kselftest/runner.sh |  3 +-
>>   tools/testing/selftests/run_kselftest.sh    | 46 +++++++++++++++++++++=
--------
>>   4 files changed, 40 insertions(+), 18 deletions(-)
>
> Thank you Ricardo. I applied the series to linux_kselftest next
>
> I had to fix a minor merge conflict when I applied patch v2.
> Please check to see if everything looks sane.

Can you please drop commit 33880424308d
("selftests/run_kselftest.sh: Add missing quotes") ? This actually
introduced a regression. I'm sorry about that.

>
> thanks,
> -- Shuah


