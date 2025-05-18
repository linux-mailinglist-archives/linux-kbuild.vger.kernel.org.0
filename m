Return-Path: <linux-kbuild+bounces-7144-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BF2ABAE10
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 May 2025 07:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DD0B3BD858
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 May 2025 05:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CADB1DF749;
	Sun, 18 May 2025 05:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="YUMI9ALZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D187D1D8E07
	for <linux-kbuild@vger.kernel.org>; Sun, 18 May 2025 05:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747547345; cv=none; b=IeXHHDoBQNM1xyJFPfsytuz2no4X+0jpsHO1aMPq1Enkz+aj4z4j/jmC5j1hQ4wx/jBoKfN5nhpnKDCuxeCeWUHRHgclAL0LnP/YvDX4zHx53Cm7OoGhO2LOl6pb/Va77ugjCmItHWZ1C50dKLVEJQYHBAl9nuKsRPX7JVKgn+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747547345; c=relaxed/simple;
	bh=eZBpP6KfUKXCXO83nQ/GJ5KM078e67pg7DbDDBqWLsc=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=LhS5xyXj8NEufuVNyb3IxhMQYKPTD1wLaRkMYWiBJXuLv9Yd9XyOki7bFRR4d1dHvS8qcMlA32Q7W+ZdquJvR0rtsXAayUrrRB2Tw5/ksKVf/DfxJ8Qhz9yIVE0Gr6wkBwBVggEohIV4TskN8zGDHS1b1DqdRpUNtJNiPcnC2lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=YUMI9ALZ; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f8a87f0c0fso31155576d6.0
        for <linux-kbuild@vger.kernel.org>; Sat, 17 May 2025 22:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747547341; x=1748152141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9qeFJ7lNo+yYpuKZq/TR4G2C9hCrYbOgamht3tIasA=;
        b=YUMI9ALZ3F59PQe6HDiEQTb/qxV1VE4OfL9j2tyimMWzoXQ3RQudHnmcg1S2lfJqNj
         yH0MQoiQ8FCkQn3/WR9Cve3698ogucsVNoUHGjVECMPsUCpaGy01roAw7fz0lQzlsrJK
         oKQPvXlIyc78VOcTyc3WgC1JeR+XKsM6S5hGrvgfNQME7lrJ2M7UnHzKT9lYdw6QqorS
         +bxkp+exwio/ay+2al+6dNaeypjd1qLAN/w9gVLh/920iOV4aOUYC2Seodi7NYWnIu6Q
         Kxfoe7yX3g0lZ68WNdRy6Z0SClgeZACMM1gWdyWLi2GMZqiT+IgYLXcx02oA2MblLctv
         v27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747547341; x=1748152141;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9qeFJ7lNo+yYpuKZq/TR4G2C9hCrYbOgamht3tIasA=;
        b=fxH90iMSzlD/US6LOuZBEaESvoVIf2L8JB12+7ebnvnB/kLOxp4L64ZEhXoFvPnc9I
         vvDs4pahfQvYR6zFvvRhvzAnmJZid/Fn4LXdXCVpWA0YHj9AXkxdFL/twbgEAPQJIeU+
         xGSSKJ2oGaJcSHkaIp5P+p3wlXzsSFftSOJ109EkE8oWF1DZhig1GIkHEEJtdX5LekTA
         aBfxfYKpk5xDZ/6erUl8omBQ9O0yhUnezj9drBA4nOfiQABToGJ6/DabMQPuPwpIKi6/
         CxGSGc23j1oUaEXMzKsCOMumDgEmc/ulSyjgXwQnmnjmkZBd5Gfj5EQ76/hSM+KmMKUj
         2Yrw==
X-Forwarded-Encrypted: i=1; AJvYcCVDNRKK3hBx7S64zxT/c8I+uxEmFdmEK+joENRO46Vru8Kcsioa22XKu/I8b9LTf8+S6p7jk5CO63T08yU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy073lNpuNw4ehq5NuID4PB4a00bNI12P3U7pbAPqxmw8VQxG3g
	KqR/XnqizfCizVg+OBUbsSCvoRRgjXSP1/jUKFosAhFmEB1W7r7ehlqVsfswpz6fzg==
X-Gm-Gg: ASbGncsVnACnw6iMg5FOpNNJyc/WVbeCvRlGERKawMwUeJBvVQ7WnGNmqPuHc48tvGX
	MQQYRUBQaQm6cL9yTIf8g4wZgOnOvagKaE/34fJTBEWF/zh3pubW1UcTnvyT8w/nWTGWMyNXsIo
	6b32Gu6lYELN/JK888FuSyUFQWNbLdP+Rk26lrCdkUZIavnEkT1N1lIZNNsMKKFZ7jAYuQ+z/ra
	j+Wrq3W8XTEDQJI60qpAQR8/NM+bqUypxbldPJ2dL3upZOZKImh6Ghb7IXLJ2j2Toe21DONoOrM
	mU+3R4eHohGAmMDg1o7Y76/kqETnipgUXwkTBGRJUvcQKb9hmkmHUJ5AnmT85+pGlrp/eRvhXID
	ak7qs4H30CPlBOr6GcIl59TduAg==
X-Google-Smtp-Source: AGHT+IGfrmclUyrn2kL47uhxEFRGU+qhsbvKEWHTIktNb5yLBqfzULKgvSCB1fjnKNy9EuB8fUsqdQ==
X-Received: by 2002:ac8:6f10:0:b0:477:6eca:b40c with SMTP id d75a77b69052e-494ae326c18mr161157901cf.1.1747547341540;
        Sat, 17 May 2025 22:49:01 -0700 (PDT)
Received: from [192.168.7.16] (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3f922csm35228371cf.26.2025.05.17.22.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 22:49:00 -0700 (PDT)
From: Paul Moore <paul@paul-moore.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
CC: KP Singh <kpsingh@kernel.org>, Blaise Boscaccy <bboscaccy@linux.microsoft.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, bpf <bpf@vger.kernel.org>, 
	<code@tyhicks.com>, Jonathan Corbet <corbet@lwn.net>, 
	"David S. Miller" <davem@davemloft.net>, David Howells <dhowells@redhat.com>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jarkko Sakkinen <jarkko@kernel.org>, 
	James Morris <jmorris@namei.org>, Jan Stancek <jstancek@redhat.com>, 
	Justin Stitt <justinstitt@google.com>, <keyrings@vger.kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	<nkapron@google.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, Matteo Croce <teknoraver@meta.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, <kysrinivasan@gmail.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 18 May 2025 01:48:57 -0400
Message-ID: <196e1f03128.28a7.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <CAADnVQ+wE5cGhy6tgmWgUwkNutueEsrhh6UR8N2fzrZjt-vb4g@mail.gmail.com>
References: <20250502184421.1424368-1-bboscaccy@linux.microsoft.com>
 <20250502210034.284051-1-kpsingh@kernel.org>
 <CAHC9VhS5Vevcq90OxTmAp2=XtR1qOiDDe5sSXReX5oXzf+siVQ@mail.gmail.com>
 <CACYkzJ5jsWFiXMRDwoGib5t+Xje6STTuJGRZM9Vg2dFz7uPa-g@mail.gmail.com>
 <CACYkzJ6VQUExfyt0=-FmXz46GHJh3d=FXh5j4KfexcEFbHV-vg@mail.gmail.com>
 <CAHC9VhQL_FkUH8F1fvFZmC-8UwZh3zkwjomCo1PiWNW0EGYUPw@mail.gmail.com>
 <CACYkzJ4+=3owK+ELD9Nw7Rrm-UajxXEw8kVtOTJJ+SNAXpsOpw@mail.gmail.com>
 <CAHC9VhTeFBhdagvw4cT3EvA72EYCfAn6ToptpE9PWipG9YLrFw@mail.gmail.com>
 <CAADnVQJ4GDKvLSWuAMdwajA0V2DEw5m-O228QknW8Eo9jxhyig@mail.gmail.com>
 <CAHC9VhTJcV1mqBpxVUtpLhrN4Y9W_BGgB_La5QCqObGheK28Ug@mail.gmail.com>
 <CAADnVQ+wE5cGhy6tgmWgUwkNutueEsrhh6UR8N2fzrZjt-vb4g@mail.gmail.com>
User-Agent: AquaMail/1.55.1 (build: 105501552)
Subject: Re: [PATCH v3 0/4] Introducing Hornet LSM
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On May 17, 2025 12:13:50 PM Alexei Starovoitov 
<alexei.starovoitov@gmail.com> wrote:
> On Sat, May 17, 2025 at 8:03 AM Paul Moore <paul@paul-moore.com> wrote:
>> On Fri, May 16, 2025 at 7:49 PM Alexei Starovoitov
>> <alexei.starovoitov@gmail.com> wrote:
>>> On Fri, May 16, 2025 at 12:49 PM Paul Moore <paul@paul-moore.com> wrote:
>>>>
>>>> I think we need some clarification on a few of these details, it would
>>>> be good if you could answer the questions below about the
>>>> authorization aspects of your design?
>>>>
>>>> * Is the signature validation code in the BPF verifier *always* going
>>>> to be enforced when a signature is passed in from userspace?  In other
>>>> words, in your design is there going to be either a kernel build time
>>>> or runtime configuration knob that could selectively enable (or
>>>> disable) signature verification in the BPF verifier?
>>>
>>> If there is a signature in union bpf_attr and it's incorrect
>>> the prog_load command will be rejected.
>>> No point in adding a knob to control that.
>>
>> I agree that when a signature is provided and that signature check
>> fails, the BPF load should be rejected.  I'm simply trying to
>> understand how you envision your design handling all of the cases, not
>> just this one, as well as what build and runtime options you expect
>> for controlling various aspects of this behavior.
>>
>>>> * In the case where the signature validation code in the BPF verifier
>>>> is active, what happens when a signature is *not* passed in from
>>>> userspace?  Will the BPF verifier allow the program load to take
>>>> place?  Will the load operation be blocked?  Will the load operation
>>>> be subject to a more granular policy, and if so, how do you plan to
>>>> incorporate that policy decision into the BPF program load path?
>>>
>>> If there is no signature the existing loading semantics will remain intact.
>>> We can discuss whether to add a sysctl or cgroup knob to disallow
>>> loading when signature is not present ...
>>
>> As mentioned earlier this week, if the BPF verifier is performing the
>> signature verification as KP described, we will need a LSM hook after
>> the verifier to serve as an access control point.  Of course that
>> doesn't preclude the addition of some type of sysctl/cgroup/whatever
>> based access control, but the LSM hook would be needed regardless.
>
> No. New hook is not needed.

It would be good for you to explain how the existing LSM hook is sufficient 
to authorize the loading of a BPF program using the signature validation 
state determined in the BPF verifier.

--
paul-moore.com

>




