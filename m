Return-Path: <linux-kbuild+bounces-5632-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32399A287AF
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 11:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 220AD188A583
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 10:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E42522ACD3;
	Wed,  5 Feb 2025 10:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VhePItP0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDB222A4ED
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Feb 2025 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738750478; cv=none; b=QILbtHF7xRVJdqv+Zrv4Wb40croTQyQk9VYH6ziW6P9KOW4uUSzj8wiEuZxn2dCL8mnSPu7BZJJ4O6dmipq4dFuOjUpqA/P/QvaSV9ON0OiMtL0YPN4Fv420H32Ewx5c2XWrORmEJvnK6kfK3a8AK+R9dMAO1v2dAMRdo/o/Qbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738750478; c=relaxed/simple;
	bh=cl3s2u4k8LqaA7VoeY6ZsMAhGEyET2LwEcvJM2G729c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z443itIbCOkfBz2PELVmyOd9gkl2fUtkUSebaMkNsoCYNiz2poGZMk3vSpIq75rr5G6KqklU74Fk+wCgvFl7DGB6KntYLQ1zOpX7hhXGAS3K4sewpaDXQZBPb9IPi/fh6YWgjWOkZ7xxQaqdm/yFMXlA/Lmh+ZiCtFujUjEtAm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VhePItP0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38db0c06e96so844910f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Feb 2025 02:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738750474; x=1739355274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4TpE+w64W/w0pZz2iY3aYODrTAmBDToH0rXVM/D9B+U=;
        b=VhePItP0iFUehcJB8Og+OGWbacraWABzNa1xFhjuTDP1+Hs7zLEvdgQ03uWhP0kG3J
         VP9f3+36uaDMpOTbl1qKA8xN0qB/vxFRN52DqzZC1k2j1Op9q2FF24jP2qJTpFrleSCL
         8TlikM9jGiR0f/+G2xG7BlMZCjmPFt2d91L1YZd3/t2t+WlSHc16hZv8HOwERhhk7j3h
         AKGAY6IahTjLIERzBYb596D5/f8tSNZhgcarbuJlBINx5R+i35JpgSxEhZCbDh2oJyfs
         4ZPk4bC/x53Lauo7QH4xQyplnJdzar9gKo4LBAnI/MGW575jhqQ4aat3fqQzsokxWLnr
         DdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738750474; x=1739355274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4TpE+w64W/w0pZz2iY3aYODrTAmBDToH0rXVM/D9B+U=;
        b=U3ylXpuezvt19evYBCYEo8f98ZXHywrcIksSU3BTMS0z9/FVBEJISr4p4f23sPAtGQ
         oPyoRpfLq/Zh6E+xtdM+boIpY4l7XHYXKWuHajlzypPWe+8u/6SF6Og2jPgFS02JIiev
         ue0e41QzHm34n5sjtpZ1A31v8uD2+Xc5JdAJocd9U0rWqvW98PVP5n52eW9AxHVuOhPO
         ekauYlptPxboUIRRYoMYaemx3dZNGllPlYdNjnGB+KiR8grW/rQgFtEcko6Zn6Lqs84/
         25UC+5kGWc+x2C9M4xyFJsDihNjQewu9/jzzEmbF6a1ngKvDrMNMA/YDthIcnGDpaPsm
         Y+pA==
X-Forwarded-Encrypted: i=1; AJvYcCVpmKiY7Qo8Ub+3Sy1IpFF/FFUNtZen6lj2u+7U8565qlo7reeHh8Chs0bNTocpX2gR0uGgWKxSKzfA/Rg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSBRwNuKN/Y29Lw6sPaNq6SpOSsBQNchYewgXNv1WvUX4CVH49
	pnEfDRP16EkXeTJkh8QdzxF9zQhIifvqFPNdV3jUfsLgwYmWQUpr0HVYlk7+Hd4=
X-Gm-Gg: ASbGnctGUR8mppNeKJ4vOygeM3BLBd6xeNLV+3Fts3qHu4YlN7UmJT1LKVINVAK1NTb
	9DXOnorLjF8cSyt0/nsoJCXQ9pEH3CPZabR910Za//V9yDFmXu3+7V/MRKnqGm8m2e37FsPUFUv
	4PbbmKAEaOSUy1IqZKRTpbVIChi+U4Ceg1oZiGpY9uxC6O4PG0ZAwSJrbbR1xpMQhvVjDRGLa/U
	0QP4JypEd0xhdSSZADrYRFA8FisA+CV9TXePoVTmUcJvGech2z97xeL63a6u6bJ86ypVKHeEUAn
	gfmnN+Kd8YIOzHKBVfI=
X-Google-Smtp-Source: AGHT+IGrKqVhCP3AqODgr/FPITUVbZ9hb54g8ST6SnNmmjRUjIBUB7Ppw2hDlDy1xMw/NeyEYRNS1A==
X-Received: by 2002:a05:6000:1208:b0:385:f72a:a3b0 with SMTP id ffacd0b85a97d-38db490d6b2mr1196407f8f.55.1738750474338;
        Wed, 05 Feb 2025 02:14:34 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dac5a3e79sm4267717f8f.63.2025.02.05.02.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 02:14:34 -0800 (PST)
Message-ID: <b35737df-01ed-46a2-ae67-e56547d6c824@suse.com>
Date: Wed, 5 Feb 2025 11:14:33 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -v2 0/7] module: Strict per-modname namespaces
To: masahiroy@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, mcgrof@kernel.org, x86@kernel.org,
 hpa@zytor.com, samitolvanen@google.com, da.gomez@samsung.com,
 nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 hch@infradead.org, gregkh@linuxfoundation.org
References: <20241202145946.108093528@infradead.org>
 <94bf84a7-13a3-4701-807e-fc0f10d4dc88@suse.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <94bf84a7-13a3-4701-807e-fc0f10d4dc88@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/16/24 17:43, Petr Pavlu wrote:
> On 12/2/24 15:59, Peter Zijlstra wrote:
>> Hi!
>>
>> Implement a means for exports to be available only to an explicit list of named
>> modules. By explicitly limiting the usage of certain exports, the abuse
>> potential/risk is greatly reduced.
>>
>> The first 'patch' is an awk scripts that cleans up the existing module
>> namespace code along the same lines of commit 33def8498fdd ("treewide: Convert
>> macro and uses of __section(foo) to __section("foo")") and for the same reason,
>> it is not desired for the namespace argument to be a macro expansion itself.
>>
>> The remainder of the patches introduce the special "MODULE_<modname-list>"
>> namespace, which shall be forbidden from being explicitly imported. A module
>> that matches the simple modname-list will get an implicit import.
> 
> @Masahiro, I'd like to take this on the modules tree for 6.14. Can I get
> an Acked-by you for the changes?

Ping, this still applies mostly cleanly. I plan to take the series on
modules-next, or let me know if you prefer for this to go through the
kbuild tree.

-- 
Thanks,
Petr

