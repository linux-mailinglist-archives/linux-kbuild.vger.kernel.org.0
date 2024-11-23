Return-Path: <linux-kbuild+bounces-4810-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C06C9D671C
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 02:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0556A16164B
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 01:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DE0257D;
	Sat, 23 Nov 2024 01:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRziH050"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19802A59;
	Sat, 23 Nov 2024 01:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732326856; cv=none; b=A6ZNZuaUTksfQtkpPEsKKmbzoiZPS5HQvpETm7/mtJv38QVggWb3e7x2yyFkOBhj4kGRqQS0MrWoSQ+oYtZ1rC8Qif/XOf8h/R0dbOZgOw/1pa97OCpF6fhEKbCJhD+z40/pxGKjcsiXTmrFYB6jooS1H3O3MZ08l8vT5U8lkBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732326856; c=relaxed/simple;
	bh=o0rQsixvk+BoxGi8EPzy3Li3/gP0HzrlzPqJKe8VeSU=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=t8U4w2DxEwxsi682cadHCrXNbSsWIplsLFZg2rBdi+HAQiOj4b/gN8SILnNtXbJ7uKt4NbvcFjFl1fbcJy0cbavcUgfFGAn38PeZ/yOmoksBEa5lB52in5eNKOl+Y9zYvYlwHBhAQrqxcPS6Sn9FwFXjMaMapJhdk6pY728kSdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRziH050; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cfa9979cd1so4651949a12.1;
        Fri, 22 Nov 2024 17:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732326852; x=1732931652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ux7JpAah+n06vzV7mr3Rr/cfl5jMrQ1nyMBvYGDgus0=;
        b=aRziH050knBlPLS0Fq3njgFx2LVHTYlyJL/VGnCI2CTymdMBNRLzB3v8gL/H8kR3HQ
         lBeBRdJXCMOe0uY0E/z7KXArKu90kHiwsy7pc+CdAdcgDSe6v4jUapFx3MJWGD3PcVBI
         K6DrwoVpQihRVDdQOdzwO8EB9R2lM9D7UrS4hP2cHzzXNt0qVw9Za96YrWA8t/TosSqM
         kpFZg1D2yQrrLExcFkwdM7jJ+Yu/olq1Cvt3c5v2ROxseHPa7puIueVOpUmWaQDkUZ+d
         5grCXR1OhhR3cY3n6Y8nfxIQ1uWT43y4SlqBBhs9a8PNdbL7O9q1JrktBiRvpOCWtZwN
         bONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732326852; x=1732931652;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ux7JpAah+n06vzV7mr3Rr/cfl5jMrQ1nyMBvYGDgus0=;
        b=Y5JX+CUOHJyNCQHjlb6MQO3Zp8y+xaiokJobtYGuJ4QpAqejqmhIcvHmnexkh8Ns5c
         QJqMTe7sNiUpB0jd6OF0HbjhlIBmG9uh6kqK/X06B7ESU8rKH0r3ywbYdfnygqCjMoij
         Dkr1+HJISyeQ6gmlBfoRkkf3rwJRfdz4PO1Cxs8MGdE1i38zKggad7dxm+yXd3Qi4xnz
         0AZLU5Cj+/oj6g7l/AobQ6bmmAuig/LZtBNjz6B3t3p5Nl3+8TMjX63GCyoOtXKA/O/M
         l7QsmPIH0/y+DY05fgG2CgNWd/ke148uGeBb39UaY7626KlOtLR3o/a9/0YAjP45GPlZ
         6aWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLkzpFDh38tJh4IFmbm9B22dh4vEtRLk+giljhapQh90JuFbCIewZAtWmpCPM04RFaNK95NPp+aU97B5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvZRUcCBSc9/OrnIo3Md77s80HwO/9lweQT5NVxZ7haQyqqfsO
	0nLYWU7uc+d4BiJX7FnUeKBrcjxonv7NC4O4eotBcARG7bPgj8+L
X-Gm-Gg: ASbGnctm7ymLs2X6/WDx8DYaLxqkJo7ZrUpl1BGoHU3IO1gCuQez15vTgNs3WbFUsww
	0NyfaJWxb9f2PCmtayT9ZUEmupw0GggdSA7oPr3ZI80VyRlsa7pde8mlFjMH9WO5rZllu8kEe5Y
	/Ckp81Z5F6gdnk+XTLxUoVLvVBw2LBGT948OxOj17WNWmAmGJAYm59o9zQIFGQkf/JBuxiMg+0c
	bZQKIDUvvthr5L3OoufU1niMKBu3Dgqk4P5ZC15QUQ6mOR3WrQrXg4jl1Jhn/zPjmjjxuMS6lp6
	6+5g1A==
X-Google-Smtp-Source: AGHT+IFT/oEOMf7UPbFLah1oMQMu9FZit10+Et2cbMJ7Aytiz0s9pRdjgBc/Y8x12qoxqHhuOOWzwQ==
X-Received: by 2002:a05:6402:34d3:b0:5cf:beae:711 with SMTP id 4fb4d7f45d1cf-5d007c5a818mr10101553a12.10.1732326852085;
        Fri, 22 Nov 2024 17:54:12 -0800 (PST)
Received: from [192.168.178.20] (dh207-40-8.xnet.hr. [88.207.40.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3fc93fsm1471827a12.67.2024.11.22.17.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 17:54:10 -0800 (PST)
From: Mirsad Todorovac <mtodorovac69@gmail.com>
X-Google-Original-From: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Message-ID: <f50cd6ae-0d99-4836-b268-c9c86da448d8@alu.unizg.hr>
Date: Sat, 23 Nov 2024 02:53:09 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PROBLEM] make bindeb-pkg: When just one source line in a single
 driver is changed, all driver are rebuilt?
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>
References: <f96d57c9-efda-4781-a395-a7c5fec7f2ad@gmail.com>
 <9748bda4-0db8-4c70-a321-c7189d575cbc@t-8ch.de>
Content-Language: en-US
In-Reply-To: <9748bda4-0db8-4c70-a321-c7189d575cbc@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Mr. Weißschuh,

On 11/21/24 22:43, Thomas Weißschuh wrote:

> Hi Mirsad,
>
> On 2024-11-21 22:18:58+0100, Mirsad Todorovac wrote:
>> I am perplexed now at 6.12 stable vanilla tree, and I've noticed that after changing just one
>> line in ./drivers/gpu/drm/xe/tests/xe_migrate.c:226:5-11, all unrelated drivers are being BTF'd, SIGNED,
>> and INSTALL-ed:
>>
>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/aht10.ko
>>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/coretemp.ko
>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/atxp1.ko
>>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-cpro.ko
>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/adt7475.ko
>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/axi-fan-control.ko
>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/as370-hwmon.ko
>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/chipcap2.ko
>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/aquacomputer_d5next.ko
>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/coretemp.ko
>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/applesmc.ko
>>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-psu.ko
>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-cpro.ko
>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/asus_rog_ryujin.ko
>>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/cros_ec_hwmon.ko
>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/asc7621.ko
>>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/da9052-hwmon.ko
>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/atxp1.ko
>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/axi-fan-control.ko
>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-psu.ko
>>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/da9055-hwmon.ko
>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/chipcap2.ko
>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/cros_ec_hwmon.ko
>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/da9052-hwmon.ko
>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/coretemp.ko
>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-cpro.ko
>>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/dell-smm-hwmon.ko
> This happens when the vermagic is changed. The vermagic is linked into
> each module. And after relinking all the other steps also need to be
> done.
> Building the Debian package increases the build number which ends up in
> the vermagic and therefore all modules.
> Also there is CONFIG_LOCALVERSION_AUTO which may be involved.

Yes, I use CONFIG_LOCALVERSION_AUTO because it saves a lot of trouble in bisecting.

This vermagic manipulation is beyond my grasp. I understand that modules must match kernel version, for internal ABI often changes. But not between builds of the same source? Am I thinking right?

>> Is there an option to rebuild just the necessary driver that was modified?
> With the whole Debian packaging: No idea.
> With plain kbuild: make $MAKEFLAGS $PATH_TO_MODULE.ko
This could speed up some fixes, thanks :-)
>> 2.
>>
>> >From the list of files that were compiled, it seems that drivers/gpu/drm/xe/tests/xe_migrate.c was
>> not rebult:
>>
>> $ grep CC ../err-6.12.0-tiny-pt-02b.log
>>   CC      init/version.o
>>   CC      init/version-timestamp.o
>>   CC      arch/x86/boot/version.o
>>   CC      arch/x86/boot/compressed/kaslr.o
>>   CC      arch/x86/boot/compressed/misc.o
>>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/kallsyms
>>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/sorttable
>>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/asn1_compiler
>>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/genksyms/genksyms.o
>>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/selinux/genheaders/genheaders
>>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/selinux/mdp/mdp
>>   YACC    debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/genksyms/parse.tab.[ch]
>>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/sign-file
>>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/insert-sys-cert
>>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/genksyms/parse.tab.o
>>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/genksyms/lex.lex.o
>>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/mod/modpost.o
>>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/mod/file2alias.o
>>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/mod/sumversion.o
>>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/mod/symsearch.o
>>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/basic/fixdep
>>
>> But they were only BTF + INSTALL + STRIP + SIGN'ed:
>>
>> $ grep drivers/gpu/drm/xe/ ../err-6.12.0-tiny-pt-02b.log
>>   BTF [M] drivers/gpu/drm/xe/xe.ko
>>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/gpu/drm/xe/xe.ko
>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/gpu/drm/xe/xe.ko
>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/gpu/drm/xe/xe.ko
>>
>> Nothing suggests that "drivers/gpu/drm/xe/tests/xe_migrate.c" is being recompiled, though it was modified,
>> or at least "touch"-ed.
> Do you have CONFIG_DRM_XE_KUNIT_TEST enabled?
> It probably does not make sense to use Debian packaging for a kunit
> test. Just use kunit.py directly.
Thanks.
>
>> Is this the expected behaviour?
>>
>> (I have deliberately skipped "make clean", to see if I can save some building time and grid power.)

Best regards,
Mirsad

-- 
"Did I succeed in making a coherent view on the world?"


