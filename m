Return-Path: <linux-kbuild+bounces-6016-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E9BA57BC5
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 17:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1942F188E54B
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 16:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDCA13BC0C;
	Sat,  8 Mar 2025 16:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="L3oeCnln"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155F017C77;
	Sat,  8 Mar 2025 16:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741449860; cv=none; b=iEjgwlC+/6rvt7C7TXtDKSds8zckYAIb04IZzmi5sXbQOI6wk70Uq1gDBAnm8brH6JXI8HQGxAyRpfqSdDSmC3jYVqNWLAggOoAe6kHYEQDPMlwZBmuvmtX5VZ1tMwYdZna1DhcLONrHFKLWzr/ygVljj6qtv4HW5c83GyXixLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741449860; c=relaxed/simple;
	bh=+zBPeyLIwQ3GQrILfK5tDhMKAHbfYI7Q2/ocf4qtmAo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=WbdPhfJJ/RpYr8/Xk9vxL5fNz1EZc63wwE4iNnU0VWn1etYcByXAp03raK8EVPdE5zZrn4hGfWffY4/cLKsRhIgIc6sIdigsV1XlS+6V+Fk0xENXKdIMrQh9jl1zp9gSvigo8+y8AeGDM+a5tMahA1xgm206zYKhASrut4ruQQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=L3oeCnln; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 528G1vx3843220
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sat, 8 Mar 2025 08:01:57 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 528G1vx3843220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741449719;
	bh=XZ6zT2NcuplMVReO3d9Pob3Dzop+8WCFvEBTROi2/bE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=L3oeCnlnKypB2FJSTW6d8Fse4ayJOhIcoiox2lF3RifwcuqlEGm+ubDkWHEwk2FYx
	 kwvy50gJENeAh86tlWae6AecaDrvWvhEsTMyQGp80HZjgRbBBHZQfzoKwr8XtNy9cQ
	 4nI1dJgzqtITC7q3sHt95OP+S242xPurAS1CUG/j2AaeIMZifumZ49JClp+FdvSBIJ
	 QyvBr+le59w3c+z16ArMaqrwlosQzgopw6IR+ZVyUZ6iW/KfUemXsUsGdq4A+AtWn2
	 1t0zeHUvzqfCCuHMkaO9WxgP+4AQ1jCAyF9WqQyqlx0mVGtJoyyd9iKhtg9WZ1sRX2
	 8eK1IKPlrqjSg==
Date: Sat, 08 Mar 2025 08:01:56 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Masahiro Yamada <masahiroy@kernel.org>, "Xin Li (Intel)" <xin@zytor.com>
CC: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        nathan@kernel.org, nicolas@fjasle.eu, bp@alien8.de, sraithal@amd.com
Subject: Re: [PATCH v1 1/1] kbuild: Add "make headers" to "make help" output
User-Agent: K-9 Mail for Android
In-Reply-To: <CAK7LNARHvn4Sy-e4hMmjGt0C7TFaWrGJrLq3YvN0BjehZ8QwSg@mail.gmail.com>
References: <20250308040451.585561-1-xin@zytor.com> <CAK7LNARHvn4Sy-e4hMmjGt0C7TFaWrGJrLq3YvN0BjehZ8QwSg@mail.gmail.com>
Message-ID: <FAE530F5-B657-4C72-8D69-7ABA2D3209A9@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 8, 2025 7:12:59 AM PST, Masahiro Yamada <masahiroy@kernel=2Eorg> w=
rote:
>On Sat, Mar 8, 2025 at 1:05=E2=80=AFPM Xin Li (Intel) <xin@zytor=2Ecom> w=
rote:
>>
>> Meanwhile explicitly state that the headers are uapi headers=2E
>
>There are many internal-use targets, which are not documented in the
>help message=2E
>I assume this one is the case=2E
>
>If users want to install UAPI headers, 'headers_install' is
>the user-visible interface and it is already documented=2E
>
>
>
>
>
>> Suggested-by: Borislav Petkov <bp@alien8=2Ede>
>> Signed-off-by: Xin Li (Intel) <xin@zytor=2Ecom>
>> ---
>>  Makefile | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 70bdbf2218fc=2E=2E8f5aa710105e 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1659,7 +1659,8 @@ help:
>>         @echo  '  kernelrelease   - Output the release version string (=
use with make -s)'
>>         @echo  '  kernelversion   - Output the version stored in Makefi=
le (use with make -s)'
>>         @echo  '  image_name      - Output the image name (use with mak=
e -s)'
>> -       @echo  '  headers_install - Install sanitised kernel headers to=
 INSTALL_HDR_PATH'; \
>> +       @echo  '  headers         - Install sanitised kernel uapi heade=
rs to usr/include'
>> +       @echo  '  headers_install - Install sanitised kernel uapi heade=
rs to INSTALL_HDR_PATH'; \
>>          echo  '                    (default: $(INSTALL_HDR_PATH))'; \
>>          echo  ''
>>         @echo  'Static analysers:'
>>
>> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
>> --
>> 2=2E48=2E1
>>
>
>
>--
>Best Regards
>Masahiro Yamada
>

Unfortunately it seems users haven't been following that :(

