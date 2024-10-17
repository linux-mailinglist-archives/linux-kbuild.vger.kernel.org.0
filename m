Return-Path: <linux-kbuild+bounces-4161-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ACD9A21DE
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 14:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FC371F23E56
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 12:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530191DCB36;
	Thu, 17 Oct 2024 12:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="XFkC8cCs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CF61DC18B;
	Thu, 17 Oct 2024 12:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729166961; cv=none; b=QOBaWQnasedRTwmZvQdqNqUCByxwr3rDrq4Mr+wra2zPzIryLsZ7faq2lSmyUs22CTmbHxw+aU4LNFea9hiJ/2/woHNU+/xFw8eNPl3dyStwm/uk52Bx1LIuF+O0ocHRGcEINjQG7i26mXRG0Y+DmklZWFhg9KGs2Dfd77yawXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729166961; c=relaxed/simple;
	bh=hjBpea8/wMQQI3d0ZRKaAtolWXcziTvVFZ9oxhaMpZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hh56ljn6PgqxfG18SlYiWG2gEmOll/DFK/yTaHd/ncKnyzsR2atHAYcdvJTGW1/AvfOGSVkepZ4LniCnGeyqDwLIIiQax4Ka9Hs/v4U5fg/uRLT2V+F86y2YPsos9JIxDk+N+Iske3+1w0/iYLBoNYsE2EXUjykWVxEGOnhIq24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=XFkC8cCs; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1729166905; x=1729771705; i=deller@gmx.de;
	bh=vNH0O5JPq8gnedYAMITdB6u2Uzcfqi5XJHyWv5Rb8m0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XFkC8cCsl7rxWhwyCFeIaiRDZA8p0uH9RX2Mn4jI/w2uPsQgSyLYhz/MQ9MpE4Q/
	 V0au5wJ1sKhim9E2tKjKkKhTLifv9ppV9TXWl6rycxLlwX5x+963EkKnosaCu6DH6
	 BbuqO5b2Oj/DHvBxuuYx8v7l3mNm4PA4ul5vA2QCxFH9+cfj9RKFlNNubny9pDObf
	 3QQ+YCQVZPfaETezBUOq/i2QJX4x8+u1XoDBQoeUwG//UhAMxmXMJoGzbrJW6sYQE
	 AVBVPn6Bq5R1GldlPtpN/2NXP43lxSNgi8FozWHWxPpAPGD5ONk5aDNGTxfiwJQTD
	 SHUQwjBw4wNpOh0H2A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1wq3-1u3ELw0gwr-00rxI1; Thu, 17
 Oct 2024 14:08:25 +0200
Message-ID: <9f3f6bd9-47d1-45fa-aa6b-9e0a80a5ebc6@gmx.de>
Date: Thu, 17 Oct 2024 14:08:19 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
To: Luis Chamberlain <mcgrof@kernel.org>, Matthew Maurer
 <mmaurer@google.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
 gary@garyguo.net, Michael Ellerman <mpe@ellerman.id.au>,
 Alex Gaynor <alex.gaynor@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>,
 Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev,
 marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev,
 linux-modules@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Boqun Feng
 <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
 <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
 <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
 <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
 <Zwm4v_1wh5RwuHxF@bombadil.infradead.org>
 <CAGSQo03df-tnmwcz4nh3qtuQPKQ2zLHW0juQyKUXGsdeS7QkLA@mail.gmail.com>
 <ZxBKkJu-XPOGs-NG@bombadil.infradead.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <ZxBKkJu-XPOGs-NG@bombadil.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1p/e1F7ttuQMGYqopn2AVUGUZu0cSHvDj1je+893fZhbGOowbgG
 5i2/oeoXvkVZFcqxeeGVcshUV+bPEyKpwh/R6+lxFTVQes/H2q6d24GRNoUfC/qEWdq5AmX
 Y+VU1Qomtnmmtoi7cDYJKzqkC/+JaZaDZ6mcWbB1B4Vf7/vsZfnrBL0/fWx8fbpCjz5OYfE
 BWGNMEPcCvO/TVqU6Q1PA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WsAm6YIyu1Y=;TVmdySOtqVVUrEvY6gGeOBWy5Zv
 55RIC3BP1W2gS4gwBWDOK8xth0SuXrw9Uar0o92Dq+5eHtWhGn1HR+QFA8x/uN67qj9Re9HLv
 Q19ks49VUOMD5Em4MqbiPVDpnn+anlED9LEU2LP+x5plzDKtP5I5A23H5wHZHBrdDH1xpG9mn
 EMngh5UUDO3EHodIT+u8oNj15qECfhTVqLF4Jj2rjpCaR8IofLuRbXF0RVhVgoA60Di/oMM9x
 Ag344rqbGSNRQu29oZTT3xS/KaiFiybZXyrFfPoZ4/EDs5vdK2+8SZ1g8zmqH+6+jlqQYBsWp
 KvW6iZ+uNVr7AlOvGMvFG6SPXL4fZVdHfUwF5vmfMFwbvLVPYmx1nJ7pw4NpVuymOpT+THjLS
 BPw5U3UTv8AlCuaMl2XaVtENIapcW2lyFHLr9Btc8XEdhDUpff0dLEicdeHsdxepuvgww2Qco
 FVAiefJsW3lQo7nNZMyVjiLHbTtbpVV3CkbzxlcqwAQjR9wBR6AtCUq2XoCBD7I5d5/WMFDbr
 JUPLaUjrLsFEvX8u6+RNTtI8OcUJPS6mpuTeGtN4NCv2VlyJqqn+WykH2h35Vk5tOTn2Qwdov
 iP1Ln8WR6asIZq1Kki6mLimqId3av5Q61R0IRoHBO2+yaESS3TkyRTiR0LF2z0CuD+yhi2kkG
 mri5zTQNT2NzUeNzZzmcleV9GaFRjdmBWOg9PEbuHA5h50m4kHBHN4A8CeBuBtShtzWU1TMMg
 GHz8KTEq5eXzWgfek79kXFnZLa9LhphcXG2sq/eMj0kDg7IUnsy/0c5LO+5qTYIs69JhAEr9u
 qmbQ4fqYyIFEbjMUF6zVjV6+ybV623Tvj6Q8fo751+YdU=

Hi Luis,

On 10/17/24 01:21, Luis Chamberlain wrote:
> That sounds great. Yeah, the above would be great to test. A while ago
> I wrote a new modules selftests in order to test possible improvements
> on find_symbol() but I also did this due to push the limits of the
> numbers of symbols we could support. I wrote all this to also test the
> possible 64-bit alignment benefits of __ksymtab_ sections on
> architectures without CONFIG_HAVE_ARCH_PREL32_RELOCATIONS (e.g. ppc64,
> ppc64le, parisc, s390x,...). [....]
>
> I forget what we concluded on Helge Deller's alignement patches, I think
> there was an idea on how to address the alignment through other means.
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/log=
/?h=3D20241016-modules-symtab

I stumbled upon the unaligned-memory-access.rst document [1].
Please read it, as it is a really good document, and the section
"Why unaligned access is bad" states:
It should be obvious from the above that if your code causes unaligned
memory accesses to happen, your code will not work correctly on certain
platforms and will cause performance problems on others.

With this in mind, you really should apply both of my alignment
patches which you currently carry in [0].

For parisc I partly solved the issue by fixing the arch-specific kernel un=
alignment
handler, but every time module sections are stored unaligned, it triggers
performance degregation on parisc (and other sensitive platforms).

I suggest you apply them unconditionally.

Helge

[1]  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/core-api/unaligned-memory-access.rst

