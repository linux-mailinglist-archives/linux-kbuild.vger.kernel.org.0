Return-Path: <linux-kbuild+bounces-5393-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE40A0276D
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2025 15:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05F553A1400
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2025 14:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6884242056;
	Mon,  6 Jan 2025 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YI22MAAj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B52239FCE
	for <linux-kbuild@vger.kernel.org>; Mon,  6 Jan 2025 14:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172311; cv=none; b=gUvgTYS3snLrNGOHLz4Fi+PIepSIYOMgNvNHLCZGwhY+ENc6xFnXXX5IaoadyweRw+hOzQ9H+agLGZZxs2Gzv7bMyN5HPgxy55OfqxmmY2ZaNrtIh8URkW2fnS8JvM8eFVe8JBwhhOUyzyDhSzGR6lGtYZjOrV68LLLsCvHjgbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172311; c=relaxed/simple;
	bh=lb5ZskQWeyhOiFPZA0S4xBVXj0k2PayDSit1sTmI45g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0AwXifC8cDeoJyCq4T/lC+wIZPUTDpdkfWEmKPgapBNNFUcI2eym/GC8v2oJkysRQD8Y43K+3TgdAcT9AijEeIrUqzROAgEuCsr+09fet+OWq6mlTiGXUCfQnDLN6aQN0/McMzzY+KZQtmcHEsm6wi6k9Ao96Yzwgz2H7x8utw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YI22MAAj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4363ae65100so149228205e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Jan 2025 06:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736172308; x=1736777108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YXrxzMutOrPiBTe9b2pK033uybW0Cyj3Mtb4suAcYig=;
        b=YI22MAAjhLypecVB1dx7aURDWLYRrA1llBNtj56t35PvAVQh5KGe8PQhKfWUo1/l4A
         7YM1WGrzRLl0nSupNki3KPwvWAJJlZFy5EQGueElmmeO1VirLJc48BKJ9XFbWIzeBdWM
         9oqZyCoJ5bhCGMMhAwwkLRPRuip5+opOspdtLOrXyAgJiX4p1YaQUlbVu5nzEJ1JOH1x
         uQ1AM8+60NpT/+g3gflCzZJVEUXI4fwWxET6ltRexLCP+S+p8skB/wnSkbEdf2hpovYw
         y21cmMGjVGS0mS5PBdoUTisPXj2Xtu1Lj2NuZNiDEOVtz9pUxy42xgfye+FUnl6dqI6G
         ynlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172308; x=1736777108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXrxzMutOrPiBTe9b2pK033uybW0Cyj3Mtb4suAcYig=;
        b=eS0hsrALgfoW2lKeJ1dWqIbeC8F3XeWRvlGJWg3p37QNzWveNj4EDUsQrqHZyOCmuD
         qAQ4CV8o9V6W5b+1KRzeHgvITOoj1ocMq8nAzPaQZTdiO6w+TeHvZ1ETQCCVFBpJ6+in
         YOTrELOnjgs9PPxPQC/67cCeJ/0xWDyAbiLzjE5fnD8QCaKEIbk9eAFtMf2GErkm0h02
         FaaljH7S+eyxv0MTVhFqYSrTxRXMYshIQuwvC97UiN4XG50pTgHgh9QVY1WDhJAWdSnt
         q/BQSjuvz0XMAxijfgTuLxmmI6fWDFojO6HxmibwlDkv5NTY1cYjqTycXRSpDuObuU3u
         uFLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhK774bpm07CCOuVM4pq51RXv57GIp69ZUSSKsuGP4/mK9uWpUZhfspfPUL5J6C3xppj1ps6yQg4PnumI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbq3JMOlKLCdB1lV+EDtHv2pOUt6r5t01GFpQIZtV4FQYp1Swl
	V0y7bdcIqovuyUlb0TrJhh+FTeWYTFeSbBh/yzn4R0UOC8qaQ8Gh1V+XV655Prg=
X-Gm-Gg: ASbGnctJH4qyGZTjW8YFFZtUGLqV+tGgGEKV1vuCWAPjTlSJIBY2Hz5d4SKAaqrKaqS
	ebwPg+Rbyo8SNdUfpd0NJm3F6MUzj3+o+IOcVvD3yk1FBKI8aS9prNMOIrZZM9OEH2czRX4gS9d
	iVfoWEQFy5aYm6TQRSKiWbhGvqrdgM+KTe8hcjByx3lHpl1x+dmj+NuQGBcxRUmGCZUfMCbbtRI
	RmWLHqpCszDR7CuE/vjpekKonZJv2WEWZMNme0Y/5hp3CfzmZ6dwgWCvID0
X-Google-Smtp-Source: AGHT+IER4TOxKmNFL7XQySabj9Buo0ZRW4zKb+TIcHyvqLWSuOS7yKuZ8lkaizvjM/3T6w90reldxg==
X-Received: by 2002:a05:600c:1c25:b0:434:f4fa:83c4 with SMTP id 5b1f17b1804b1-43668b5f691mr477152185e9.29.1736172307905;
        Mon, 06 Jan 2025 06:05:07 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436840b35b5sm422147405e9.39.2025.01.06.06.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:05:07 -0800 (PST)
Message-ID: <d9ace384-07bb-4fa4-9590-9f739be8e3f5@suse.com>
Date: Mon, 6 Jan 2025 15:05:06 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] module: sign with sha512 instead of sha1 by default
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, linux-modules@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <52ee32c0c92afc4d3263cea1f8a1cdc809728aff.1729088288.git.linux@leemhuis.info>
 <ZxQ5QJAa-iv4S6sw@bombadil.infradead.org>
 <54fc582e-1da0-410d-b410-316792e3472b@leemhuis.info>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <54fc582e-1da0-410d-b410-316792e3472b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/4/25 10:43, Thorsten Leemhuis wrote:
> On 20.10.24 00:57, Luis Chamberlain wrote:
>> On Wed, Oct 16, 2024 at 04:18:41PM +0200, Thorsten Leemhuis wrote:
>>> Switch away from using sha1 for module signing by default and use the
>>> more modern sha512 instead, which is what among others Arch, Fedora,
>>> RHEL, and Ubuntu are currently using for their kernels.
>>>
>>> Sha1 has not been considered secure against well-funded opponents since
>>> 2005[1]; since 2011 the NIST and other organizations furthermore
>>> recommended its replacement[2]. This is why OpenSSL on RHEL9, Fedora
>>> Linux 41+[3], and likely some other current and future distributions
>>> reject the creation of sha1 signatures, which leads to a build error of
>>> allmodconfig configurations:
>>>
>>>   80A20474797F0000:error:03000098:digital envelope routines:do_sigver_init:invalid digest:crypto/evp/m_sigver.c:342:
>>>   make[4]: *** [.../certs/Makefile:53: certs/signing_key.pem] Error 1
>>>   make[4]: *** Deleting file 'certs/signing_key.pem'
>>>   make[4]: *** Waiting for unfinished jobs....
>>>   make[3]: *** [.../scripts/Makefile.build:478: certs] Error 2
>>>   make[2]: *** [.../Makefile:1936: .] Error 2
>>>   make[1]: *** [.../Makefile:224: __sub-make] Error 2
>>>   make[1]: Leaving directory '...'
>>>   make: *** [Makefile:224: __sub-make] Error 2
>>>
>>> This change makes allmodconfig work again and sets a default that is
>>> more appropriate for current and future users, too.
>>>
>>> Link: https://www.schneier.com/blog/archives/2005/02/cryptanalysis_o.html [1]
>>> Link: https://csrc.nist.gov/projects/hash-functions [2]
>>> Link: https://fedoraproject.org/wiki/Changes/OpenSSLDistrustsha1SigVer [3]
>>> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
>>
>> Thanks!
>>
>> Tested-by: kdevops <kdevops@lists.linux.dev> [0]
>> Links: https://github.com/linux-kdevops/linux-modules-kpd/actions/runs/11420092929/job/31775404330 # [0]
>>
>> Applied and pushed!
> 
> Lo! Just wandering: what happened to that patch? That reply made me
> assume that the patch was heading towards mainline, but it seems it's
> not even in -next. Were there problems and it was dropped or something?

I can't recall that there was any problem with this patch, I assume it
felt through by some accident. I've now queued it on modules-next.

-- 
Thanks,
Petr

