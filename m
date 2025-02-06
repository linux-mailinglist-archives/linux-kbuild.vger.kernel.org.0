Return-Path: <linux-kbuild+bounces-5643-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4262A2A34E
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2025 09:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E368A7A4AA4
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2025 08:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2C02253F1;
	Thu,  6 Feb 2025 08:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="jmMKnNXR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F27225419;
	Thu,  6 Feb 2025 08:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738831045; cv=none; b=SzN2LwBqsFFSKTpfY2TTt1CVqw1tEmMeoBOP5ThL1SS1SxnwzYL67+4jT7UxH7hg72CI1YcIsKVKnDE8OJxMjVPR88S/+TFkHQaPUnCwhgCV/ZoK1YzEvLFREMit640jB3CyL238ElOn6SBmwGeQ2Z6YCH7QXDCgjyz9ryTrHg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738831045; c=relaxed/simple;
	bh=O4Y99wLIZt5HigjK77gneneZZSdsJM7zvVgoZ8+vvJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vqh+j8ppHydelougp+zkB9Xkqc6JVzs/fU5rqB4dIYO0ckJzGVAXCBGEroFUby93cGT9hJ4Q6iwHw4h+t3X+gczqp4yiz8eZQ9zWXCVlucqYUX5ufHqC3Zr1HSNrcNraKSTXogtfpescGdNQJLlF6z5HzBgAB8epwSt1yYNtldw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=jmMKnNXR; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1738831031;
	bh=OQ7iIR5qM+sWvITBpGMCDcVBhEoGye+nzy0tYomJPkM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=jmMKnNXRoOAA59hHuVFB06ArgotIS3jzSrhdumJ05N84iSEAxcxvxvb9CSGrcOACu
	 eO1+5E9ZXa+YBkIA1IO6HV6E7hB6NddTDEPrIJ/gwNTuoZPmhlqFvd8HqpulgzRsis
	 dK0vMk0DTIS4f27s3ehXyHr60FmFRNGabeyNSvGU=
X-QQ-mid: bizesmtpip2t1738831027tx2q5lh
X-QQ-Originating-IP: z49N5IvJbdUnc3tmQDxAkyLkZWVnWMWOUMvl/ipEl/Y=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Feb 2025 16:37:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11712325770140657364
From: WangYuli <wangyuli@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: ardb@kernel.org,
	chenhuacai@kernel.org,
	chenhuacai@loongson.cn,
	kernel@xen0n.name,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	masahiroy@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	nicolas@fjasle.eu,
	sashal@kernel.org,
	stable@vger.kernel.org
Subject: Re: Re: [PATCH 6.1&6.6 0/3] kbuild: Avoid weak external linkage where possible
Date: Thu,  6 Feb 2025 16:37:02 +0800
Message-ID: <F6E14B0130692444+20250206083705.63378-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <2024120635-wham-campsite-b62b@gregkh>
References: <2024120635-wham-campsite-b62b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MFdGPHhuqhNowwLw5bWiHJVG1q7MoivVF5XyHlraL0CkG5N2UT9WvFe9
	x6ajWDz9a3fCpMD21FEyiyus+jndNsTM426Xk5ZkVcOdevx39A8LbIw5fSoF+zkoQhC6N3E
	7NlAziJuQpxxmxmSzzhsyuo/pQwFM725v1+AXGyUoWuWyNTCvZ9kRQ0VNQGzU8YYHf9kQ1d
	46RtccoBpXq8oLqtA4UIE+h48+IJniaKlE7oJahQCvIx6ucR4gm907+jqOf4NvWIs7woKZV
	8P29eXlw6rjp4VTz1rjhv9aDS70OinV8QpIItxQuvIGGLFtVHw+VKCoNmIko0rSRRlamSro
	pIbVfrcSFs5SrPPRU4YA9TPEv5ei+noLb3noO5jPpXjYK8i8Z8slX9Br1hVXMEsn6AwNNve
	0P4bmXkbnCQD6saDaFgrIqnPwUqa7qmaycKUf8qdG29YikqNjdAMi8gFKCDYGQ9QRXzbtmg
	+a0avU4N7WpdIU0jgWYERjGQzpQhieKuQOgQAUMoar83ykeEsD++Sz9hrlISYLwMTg/+Wka
	aiMWLCyHvAzK+SpVeD243PPjiIuoSMkfDfGh7MgBz+p0YPrh8zra0ldmesViq68K/xrVa6d
	RXr2eJFVxD7ryb7Y2NDCtICzfvmWGRoxFRdfN2wUlYNRokj1W1h6v1UdAD/CL4RtjaFh8+H
	jdw6Ykk3wFIYjZ7SErUqU28Jwc5Lzk8uu/miJmQurXbDgiw5xSffisOC4wyDN0gYz+vrYfT
	8I8ypD1LoBpj7TgwWHawSp/V7sII+426GdGBRVmeyrS3kme3W93Wlbm0e8UQXjDG+Aaqj1i
	JTXM8tRCvv3JnasM5qAJEcrdVvrbrBRAPKWrQk8eUcAGb6hxoWjYuUnJRXzUviU0c7bcwCZ
	P10bGDd2lQSQ+i1wsD4ulfn0k7r6BCxlBaMjK4AzP8Z7RFtfXvCf8m7b+tXGtnmSUFj4IWf
	Mjj2ltiNaao/AqVT9JBmpboYTd/7Sfavan197A9VJlAYJ+Fja7XBRD4E+G/kfYhAro2IG57
	j0coZpBw==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

Hi, Greg,

It's rather unfortunate that currently, almost all Linux distributions
supporting LoongArch are using LTS kernels version v6.6 or older, such as
openEuler and deepin. [1][2]

If this bugfix isn't merged into linux-stable, then every single distro
kernel team will have to waste time fixing the same darn bug over and
over, even though it's already fixed in later kernels.

This would really make LTS look like it's failing to serve its intended
purpose. And I'm sure all of us do not want to see something so terrible
happen.

On Fri, Dec 6, 2024 at 9:04 PM Greg Kroah-Hartman wrote:
> Odd, why doesn't this affect other arches as well using new binutils?  I
> hate to have to backport all of this just for one arch, as that feels
> odd.

Could you help me understand why you expressed that you "hate" to have
to backport something for only one arch?
Given that we've historically done quite a bit of similar backporting for
architectures such as arm, powerpc, and x86...It's not exactly unprecedented.
I just want to grasp the rationale, as it all seems perfectly justified
and necessary.

Moreover, with all the active and strict code reviews by all developers,
such occurrences are not frequent on LoongArch. You could be not exactly
"always" backporting something like this just for LoongArch, so perhaps
that might make you and your colleagues feel a little less "hate" :-)

As for your questions on the root cause of the issue and the effectiveness
of this fix, I reckon Xi Ruoyao's explanation and Ard Biesheuvel's
supplementary points have already provided ample details. [3][4][5]

If, after your feedback, you still have any lingering doubts regarding the
issue itself or the LoongArch architecture, I believe that Xi Ruoyao,
Ard Biesheuvel, and Huacai Chen would all be more than willing to elaborate
further.

I'm bringing this up because we've encountered concrete issues in the
process of maintaining distributions. Furthermore, as an upstream resource,
linux-stable can help us more effectively drive forward community
development efforts.
Plus, we realize this benefits all Linux community developers just the same.

Hoping you could spare a moment from your busy schedule to take another look
at this patch series and perhaps reconsider the LTS inclusion of this bugfix.

[1]. https://gitee.com/openeuler/kernel/blob/openEuler-25.03/Makefile#L3
[2]. https://github.com/deepin-community/kernel/blob/linux-6.6.y/Makefile#L3
[3]. https://lore.kernel.org/all/ccb1fa9034b177042db8fcbe7a95a2a5b466dc30.camel@xry111.site/
[4]. https://lore.kernel.org/all/CAMj1kXEV+HC+2HMLhDaLfAufQLrXRs2J7akMNr1mjejDYc7kdw@mail.gmail.com/#t
[5]. https://lore.kernel.org/all/c9a43e5da01ee2215393c0f3c50956171fe660ab.camel@xry111.site/

Best Regards,
--
WangYuli

