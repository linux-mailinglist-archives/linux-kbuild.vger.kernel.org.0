Return-Path: <linux-kbuild+bounces-6735-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD9BA99E9F
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Apr 2025 04:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 152575A82FD
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Apr 2025 02:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C68B17A303;
	Thu, 24 Apr 2025 02:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnvrPzm9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFECA4A29;
	Thu, 24 Apr 2025 02:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745460433; cv=none; b=Drrj7sA/HsL7gpSh6aYyTCAEKgmr1dwkSj1idgfM5iBh2YEkxC1gk5UUJckEYSpb2r3ibXwLcmtezMZ2Vai7PRV7bR7uU4rxpIzFHzxSDJ28SQ/KQ/fzIkGnsVw6lUc4VVxSdZqvVKcUhYl3COfbkDT1w4qsnSs5b38zqs3l5bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745460433; c=relaxed/simple;
	bh=t6RcUduhFTrU3yGEzjwI1EOIrjSudFdZ/ut9hrEsWvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=luNx3l31paXQbGQQxtColMeJ4xbvjHwzVIC47oOcqwzxqrLRe3ej7Zac0MNazyuG8HF/pt9cODXV5huOu6pj8DDj+6MTW5yvL/DNSzcVFMX27i7ft2KrXfr4QZvjkuRlVefglnZE5hsksaWA815OsneaV4C2B68TC40V6e1yjmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnvrPzm9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-227c7e57da2so3978165ad.0;
        Wed, 23 Apr 2025 19:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745460431; x=1746065231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQNbrZUbkkakbD9h0kzAkS4WI87+xA7QvTn2xWNikNQ=;
        b=gnvrPzm9Y+mN0zgFG3gdQ3HB1r9wUVLQTWKTeEgeokjDpmJgP1/jj8jsE9wKzFuLY9
         U/DmQyTZr7RggrvqjV7kY4MyCNXuVt4UY9sf1+QNNJnU0vDShGLkAC+5XN94/v0NUvlE
         N0t9wXOcAsQlwaqnhtHFMoGTw7ofpcguxe0pk8IjGuKpJJfri9Kyc/ZQAoa0KLqU6OfD
         8KP1h+OojBrSVpMvDgkauJ3nk1MU15RoMxW/4HDx11Up1A+KScz+/Sk5+gCwOmMM0WkX
         MsehNQi9XYD5xUTd0vtWRlgHObze621irGUXnKacHELiUSan3Xu26icwAyNYToroXun6
         et4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745460431; x=1746065231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQNbrZUbkkakbD9h0kzAkS4WI87+xA7QvTn2xWNikNQ=;
        b=omRNkhZsNNipOB/rn1X21L0KFYFLYSO5Z6RslWSz0Fq3sjf91S2B3Lq04Oo3YWJDa1
         Zf1UqdXgIAEXDo+CEKho8L5mgiG26wA4xCSUPjb/GmATf/ovtl58c9dupbHauj4i2f/T
         jAAz9zQD4fgu0rijtomtP7IWjcalD/4VbLel08onnWgorpLdoAUW/yhS2n+/acbJLaDu
         gM2RjWJJq6+v+CWOIySQFKnJAUr35HCbrHICj1ZQemIqwqvd6e8PS4tvV7/nHvAqAcG2
         rIYTxlREzWMegCTnbT0zFDNdQIEmWHgOV5eUOe3Igqvs5/ag2dKHtQakbBRJg5XvOAbr
         395w==
X-Forwarded-Encrypted: i=1; AJvYcCVlhfCYCSX9y10rHGeNkJbwlsz8HD70+TRhzzE3ycCjmM8GRecmjiHlgVBs89fbmlW0cmuzqtY+pNo6DYen@vger.kernel.org, AJvYcCWE5Q0HwvB9DasxyYcr1/zVtqJLXL8N7I9FmCvmFo+ls8HHA59qStKmfNjLjnO6rElru0j9W4ZlYRYBPn4b@vger.kernel.org, AJvYcCXgGamxjFlq5RL10A7nbUmc0Osuqm1om44GSPDxKFLzcZV1TD/3T7oQRiacydDxROn5ACIbV4OIHR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYo0KjMaidtRXO/dNWUQW/SS0q18S1YN0B5wGMe2csXSryza/1
	jYaUBNH8axdwssL8wMLxRlF0DeTNEeekU6CBdhVO6hzR6/F8cgkM
X-Gm-Gg: ASbGnctw4s/GvYWIuZiGa34uAHk/eTMo+ywkdmKWG04VAbyrez5HgDzwKiTesF6tqRz
	jmMrLILkm+2vPXY70yQlT6zxno1kjhlY0h9TCKZuYre77/Aa4V8EjrBLbWW5hBHGZbJoHMvQlJm
	Wy74nHuZP50bKjg/GNFiTKVgg531zS1b03g4q7C6V5dgfYYU23IFNJby4v0xVhBH3FdcOiLbFXQ
	Qm1TIAp/YO4JpCdSVh0IVSCx/bmEdZrYbx4ubmlpHWdGKh/vTi1QbzItZm9LgN+CJ9MfiwWVjTc
	iIs84EXBddqGbjgJR9BbTeGY/PVi+rwFQYXUKmfbFJSYT34iWufvz7ljEQyXk39h+hdXt2wdjiK
	nIWp5+ZGB8Fo=
X-Google-Smtp-Source: AGHT+IFick/RvCWrsUpCfBaatj0rWffF+kCXlQbfG2Ln6b4jn4SMp+K32TykDwB6VaXqRnxR49uiTQ==
X-Received: by 2002:a17:902:d4c2:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22db3c0e5d8mr12065925ad.25.1745460430909;
        Wed, 23 Apr 2025 19:07:10 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102548sm1589505ad.168.2025.04.23.19.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 19:07:10 -0700 (PDT)
Message-ID: <5a8f0fc7-a2aa-4554-a603-3537d735dc9f@gmail.com>
Date: Thu, 24 Apr 2025 11:07:05 +0900
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Don't create Python bytecode when building the
 kernel
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: airlied@gmail.com, corbet@lwn.net, dmitry.baryshkov@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 masahiroy@kernel.org, mchehab+huawei@kernel.org, mripard@kernel.org,
 nathan@kernel.org, nicolas.schier@linux.dev, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de
References: <aAdL7aEcbulV9lsA@smile.fi.intel.com>
 <5cc4d9dd-496e-4512-a683-272b1b84d98b@gmail.com>
 <aAkV6Kl3BX1TmMxl@smile.fi.intel.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <aAkV6Kl3BX1TmMxl@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, 23 Apr 2025 19:31:36 +0300, Andy Shevchenko wrote:
> On Wed, Apr 23, 2025 at 06:30:48PM +0900, Akira Yokosawa wrote:
>> On Tue, 22 Apr 2025 10:57:33 +0300, Andy Shevchenko wrote:
>>> On Mon, Apr 21, 2025 at 10:35:29AM -0600, Jonathan Corbet wrote:
>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:
> 
> [...]
> 
>>>>> Would it be possible to properly support O= and create pyc / pycache
>>>>> inside the object/output dir?
>>>>
>>>> I have to confess, I've been wondering if we should be treating the .pyc
>>>> files like we treat .o files or other intermediate products.  Rather
>>>> than trying to avoid their creation entirely, perhaps we should just be
>>>> sure they end up in the right place and are properly cleaned up...?
>>>>
>>>> To answer Dmitry's question, it seems that setting PYTHONPYCACHEPREFIX
>>>> should do the trick?
>>>
>>> It's not so easy. The Python is written in a way that it thinks it will never
>>> runs object files separately from the source. Hence that variable sets only
>>> the folder per script as _home_ for the cache. It's completely unusable. They
>>> took it wrong. It still can be _painfully_ used, but it will make Makefiles
>>> uglier.
>>
>> But, PYTHONPYCACHEPREFIX can be set as an environment variable.
>>
>> For example, try:
>>
>>     export PYTHONPYCACHEPREFIX="$HOME/.cache/__pycache__"
>>
>> Wouldn't it be good enough for you?
> 
> Of course not. We have _many_ scripts in python in kernel and having a cache
> there for _all_ of them is simply WRONG. You never know what clashes can be
> there with two complicated enough scripts which may have same module names,
> etc.
> 

Interesting...

I'm suspecting you replied without having tried the setting...

FYI, this is an excerpt from list of .pyc files under __pycache__ after
building defconfig kernel and "make htmldocs"; and running

$ find . -name *.pyc" -print" under ~/.cache/__pycache__
---------------------------------------------------------------------
./home/.../git/linux/scripts/lib/kdoc/kdoc_files.cpython-312.pyc
./home/.../git/linux/scripts/lib/kdoc/kdoc_parser.cpython-312.pyc
./home/.../git/linux/scripts/lib/kdoc/kdoc_re.cpython-312.pyc
./home/.../git/linux/scripts/lib/kdoc/kdoc_output.cpython-312.pyc
[...]
./usr/lib/python3.12/xml/__init__.cpython-312.pyc
./usr/lib/python3.12/xml/parsers/expat.cpython-312.pyc
./usr/lib/python3.12/xml/parsers/__init__.cpython-312.pyc
./usr/lib/python3.12/xml/etree/ElementPath.cpython-312.pyc
./usr/lib/python3.12/xml/etree/__init__.cpython-312.pyc
./usr/lib/python3.12/xml/etree/cElementTree.cpython-312.pyc
./usr/lib/python3.12/xml/etree/ElementTree.cpython-312.pyc
./usr/lib/python3.12/mimetypes.cpython-312.pyc
[...]
./usr/lib/python3/dist-packages/sphinx/deprecation.cpython-312.pyc
./usr/lib/python3/dist-packages/sphinx/highlighting.cpython-312.pyc
./usr/lib/python3/dist-packages/sphinx/pycode/ast.cpython-312.pyc
./usr/lib/python3/dist-packages/sphinx/pycode/__init__.cpython-312.pyc
./usr/lib/python3/dist-packages/sphinx/pycode/parser.cpython-312.pyc
./usr/lib/python3/dist-packages/sphinx/config.cpython-312.pyc
[...]
./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/deprecation.cpython-312.pyc
./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/highlighting.cpython-312.pyc
./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/pycode/ast.cpython-312.pyc
./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/pycode/__init__.cpython-312.pyc
./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/pycode/parser.cpython-312.pyc
./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/config.cpython-312.pyc
[...]
-------------------------------------------------------------------------

As you see, each of them are stored at a path corresponding to its original
.py file.  The final part of the excerpt came from me running in-development
Sphinx in a python venv with the same PYTHONPYCACHEPREFIX setting.

I don't see any possibility of clashes as you mentioned above, quoting again:

>                We have _many_ scripts in python in kernel and having a cache
> there for _all_ of them is simply WRONG. You never know what clashes can be
> there with two complicated enough scripts which may have same module names,
> etc.

Or my imagination might be too limited to see your point ...

Regards,
Akira


