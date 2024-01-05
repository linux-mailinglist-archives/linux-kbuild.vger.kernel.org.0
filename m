Return-Path: <linux-kbuild+bounces-471-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2CC824F78
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jan 2024 09:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0890E1C22AF1
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jan 2024 08:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3340200AA;
	Fri,  5 Jan 2024 08:09:28 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB57B20B09
	for <linux-kbuild@vger.kernel.org>; Fri,  5 Jan 2024 08:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxjOguuZdlQEECAA--.133S3;
	Fri, 05 Jan 2024 16:09:18 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx398quZdlOBoDAA--.8335S3;
	Fri, 05 Jan 2024 16:09:14 +0800 (CST)
Subject: Re: [PATCH] modpost: Ignore relaxation and alignment marker relocs on
 LoongArch
To: Xi Ruoyao <xry111@xry111.site>, Huacai Chen <chenhuacai@kernel.org>
References: <20231227070317.1936234-1-kernel@xen0n.name>
 <fbefe6e45e23a09e5b63eaac0a07a2fbae4a3845.camel@xry111.site>
 <CAAhV-H44EZpOpnWyZm14QdwTLAPcxM1eNhpoDEsFQbf8=s7-iA@mail.gmail.com>
 <2f1877ed39563b42d41f03ad6d6fdd7ce4137bbb.camel@xry111.site>
Cc: WANG Xuerui <kernel@xen0n.name>, linux-kbuild@vger.kernel.org,
 WANG Xuerui <git@xen0n.name>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Youling Tang <tangyouling@kylinos.cn>, loongarch@lists.linux.dev
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <445a73e3-4e0e-0f03-3719-57975fb95189@loongson.cn>
Date: Fri, 5 Jan 2024 16:09:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2f1877ed39563b42d41f03ad6d6fdd7ce4137bbb.camel@xry111.site>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bx398quZdlOBoDAA--.8335S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uF13AFyUXFW8Jw4DKFy5KFX_yoW8ZF4kp3
	yUtFZ5KF10qFykZ3Z7tr1SgayYqas7A3y7t3yUtry5Ary2qryF9w1kA3ySqF9rtr9agF4U
	u3yxKas7CaykXagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOiSdUUU
	UU=



On 01/05/2024 12:26 AM, Xi Ruoyao wrote:
> On Thu, 2024-01-04 at 16:57 +0800, Huacai Chen wrote:
>> On Wed, Dec 27, 2023 at 7:06 PM Xi Ruoyao <xry111@xry111.site> wrote:
>>>
>>> On Wed, 2023-12-27 at 15:03 +0800, WANG Xuerui wrote:
>>>> And even though the kernel is built with relaxation disabled, so
>>>> far a small number of R_LARCH_RELAX marker relocs are still emitted as
>>>> part of la.* pseudo instructions in assembly.
>>>
>>> I'd consider it a toolchain bug...  Is there a reproducer?
>> Any updates? Should I apply this patch for loongarch-next?
>
> Tiezhu told me this should be reproducible with GCC 14 and Binutils-2.42
> development snapshots and defconfig.  I'm trying...

1. How to reproduce

I update the latest upstream toolchains (20240105):

[fedora@linux 6.7.test]$ gcc --version
gcc (GCC) 14.0.0 20240105 (experimental)
[fedora@linux 6.7.test]$ as --version
GNU assembler (GNU Binutils) 2.41.50.20240105
[fedora@linux 6.7.test]$ ld --version
GNU ld (GNU Binutils) 2.41.50.20240105

and then test it again, here is the failure info:

[fedora@linux 6.7.test]$ git log --oneline | head -1
610a9b8f49fb Linux 6.7-rc8
[fedora@linux 6.7.test]$ make loongson3_defconfig
[fedora@linux 6.7.test]$ make
...
   AR      built-in.a
   AR      vmlinux.a
   LD      vmlinux.o
   OBJCOPY modules.builtin.modinfo
   GEN     modules.builtin
   GEN     .vmlinux.objs
   MODPOST Module.symvers
make[2]: *** [scripts/Makefile.modpost:145: Module.symvers] Error 139
make[1]: *** [/home/fedora/6.7.test/Makefile:1863: modpost] Error 2
make: *** [Makefile:234: __sub-make] Error 2

2. Additional info

I can confirm that the slightly older version of toolchains (20231127)
have no the above failure, so I guess this is related with toolchains.

3. How to fix

(1) One way is to modify the kernel code, with this kernel patch,
     there is no building failure with the latest upstream toolchains.
(2) The other way is to analysis and fix the binutils code,
     it need more work to do.

Thanks,
Tiezhu


