Return-Path: <linux-kbuild+bounces-9074-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C08CBCD440
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 15:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FE0E189CDE8
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 13:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1392F0688;
	Fri, 10 Oct 2025 13:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EXbhgxEt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3E12882AC
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Oct 2025 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760102710; cv=none; b=S3x2TDPYaMyoW+TTccvmNtymNQVdUoiD6mkHosU6tOGQ8JowK+rU++AbpS6FI7ON2xyOkYxds2mRy+tYtixV51E54Bpnm5F1gSU19UqQR+y7YlfESe3hHdd4GgjmzfzCnkCr2k+z7F1GHzh3SJhk+rxvWpKeBouKe+xnDlxkK3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760102710; c=relaxed/simple;
	bh=O8RrubSJRJZ2eKPZ0ANfpKCQVkOdvA+RtzJWOt2fdes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEyTDjtPcPPsTDtYQFRFsxUJdcmFtGqYutk8lIQKKHIB+HLNb3ftjqZVNWhEVimywLxpvslK7dzeWL4gVvG9VV4eAYox6JzJu7jdwZTS/w4jvwPDgdaugznTxKB0/D3vhxeTTE25HLPkWZdjvFsarekWgzD70EY6WCiJ1R6eyB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EXbhgxEt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760102707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wzWKSf9mpTG2YCjUAY9uF/GRv8q15gJjhT+Ik15Q3YU=;
	b=EXbhgxEtoMx1wFfemrRqjNI30R77VW1w54renI372rsE9JrGSqulDcM2UVzi4XzYG8Jt95
	Ct6F7UaMkeuIMMzIZP8+E85rDzBIAqkMIJczMaWsPZRbDCMRlW2M3UDgv6yYQS5fr0eYW+
	f7rMnWLQCEzSPusskDEeNNHf6MLOBTo=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-eh_FNn2oN0mRBFXgmRIw4w-1; Fri, 10 Oct 2025 09:25:06 -0400
X-MC-Unique: eh_FNn2oN0mRBFXgmRIw4w-1
X-Mimecast-MFC-AGG-ID: eh_FNn2oN0mRBFXgmRIw4w_1760102705
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-54a9f198468so1156840e0c.2
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Oct 2025 06:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760102705; x=1760707505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzWKSf9mpTG2YCjUAY9uF/GRv8q15gJjhT+Ik15Q3YU=;
        b=eFG573Ehp/jH1f5zD1y0y0ZH9QLCNP8VWH7yMwexilz0JEO+2tHVqa+RX/0o1HMG2O
         XqQSkSSRk1cP6kl394vFoHZlcW54VjHlK0kySfi5XIBSvEoSv24fUz3xvGr657jYHFSA
         97vAQ9YZBk/i85ECqG4DGDApY7efUk/HXO460Kj97La8HPBEtWZlIzXdpPk8Ce4gP+VS
         5JQZ2/Y+2FUJaW6Y653stOFbcKgXxEzXjWtzvucoftZjw5RDVmaC5XOvDDHc3AMwMTXG
         9vSHyX0xwr3x0St0pvoL8tudydSrFuAnf4CNHKTVWCO+P7CQnxqfvv52D/ayKiScIrg9
         4yMA==
X-Forwarded-Encrypted: i=1; AJvYcCVkmsvd+KoGRkneNRSShIpWlsEqGcaMiXP0ShtO7Vm/0WKAOcFNqUPTrW0NYD/7Zd4z+OlPoxFnbQba7b8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyekaWxIc4wE9+5Q+a08LoVWPBjzM3qUNjsPeKo3GSxjQRKj448
	Z+/GnZUUUFWMs92o3jABnDtG3oUu81dgCexxZdRVyv1Q0eDJRmWyL/6gX6RGupZytjOqMnjQCgO
	tSxzn7n3pWMu4ygnK2DbI/bG7NPjAzTwcCdgCR+p3/veXm9okuRMXxJqngCoXc6ILJEFAQH8nqH
	sV6PSzYPh5BEZ0t1JonDe8ab+pVfY2FlKQi/DXmlcC
X-Gm-Gg: ASbGncslii5OYWeQWQ3f2eU8yCuVePSVA3wZGWdZoxnbY2INz8HKsnKRnjyEl9aQ03R
	qPv7AlXCSSqLbrbnQkCXeL+ERuK3lep+Aec/NaTozM6i6af7kZTMDqeZeXmnfLYtll11xrYSLqx
	xw6tHvrgPWhR5rO3QhO0OOcFf19bD38g==
X-Received: by 2002:a05:6122:2228:b0:544:75d1:15ba with SMTP id 71dfb90a1353d-554b8b972b9mr4105600e0c.8.1760102705441;
        Fri, 10 Oct 2025 06:25:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9OXHOt0tVCCgO6nU5AlWF0F3DLGcppKFsGZNXFWqEcGcaDnZmPBYeJMuUsD+NzvpJu1hAFAcw2aXzLqvRxr4=
X-Received: by 2002:a05:6122:2228:b0:544:75d1:15ba with SMTP id
 71dfb90a1353d-554b8b972b9mr4105589e0c.8.1760102705084; Fri, 10 Oct 2025
 06:25:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <28d4da3b0e3fc8474142746bcf469e03752c3208.1758182101.git.legion@kernel.org>
 <20251007011637.2512413-1-cmirabil@redhat.com> <aOToOeNGiaFVM0Ds@example.org>
 <aOgSaNejdcBWKXx8@levanger> <20251010053736.GA447238@ax162>
In-Reply-To: <20251010053736.GA447238@ax162>
From: Charles Mirabile <cmirabil@redhat.com>
Date: Fri, 10 Oct 2025 09:24:54 -0400
X-Gm-Features: AS18NWDAsD56v33pycRJmWk_jcLYYml8a8mta30luj8tpr3fHieg4TWwum9tzMM
Message-ID: <CABe3_aE+A7JtEp-8p6A8yM9ONGU4-c36AUFrtW4tGhpnXbvSuQ@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] modpost: Create modalias for builtin modules
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Alexey Gladkov <legion@kernel.org>, da.gomez@samsung.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, masahiroy@kernel.org, mcgrof@kernel.org, 
	petr.pavlu@suse.com, samitolvanen@google.com, sfr@canb.auug.org.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 1:37=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Thu, Oct 09, 2025 at 09:52:08PM +0200, Nicolas Schier wrote:
> > On Tue, Oct 07, 2025 at 12:15:21PM +0200, Alexey Gladkov wrote:
> > > Hm. Indeed. I haven't found a good solution yet, but you can use the
> > > following patch to unlock compilation. It won't solve the problem, it=
 will
> > > only hide it.
> > >
> > > --- a/scripts/Makefile.vmlinux
> > > +++ b/scripts/Makefile.vmlinux
> > > @@ -84,7 +84,7 @@ endif
> > >  remove-section-y                                   :=3D .modinfo
> > >  remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) +=3D '.rel*'
> > >
> > > -remove-symbols :=3D -w --strip-symbol=3D'__mod_device_table__*'
> > > +remove-symbols :=3D -w --strip-unneeded-symbol=3D'__mod_device_table=
__*'
> > >
> > >  # To avoid warnings: "empty loadable segment detected at ..." from G=
NU objcopy,
> > >  # it is necessary to remove the PT_LOAD flag from the segment.
> > >
> >
> > Is it problematic to hide that?  Otherwise we'd have to revert the
> > patch, right?
>
> Yeah, I would much prefer to ending up with pointless
> __mod_device_table__ symbols in the final binary than erroring out
> during the build... Does this happen with other architectures? I have
> not seen any reports yet but I have not tested anything yet. Why is
> RISC-V special here?
>
> It seems like the relocation comes from the .LASANLOC4 symbol in
> .data.rel.local?
>
>   $ llvm-objdump -Dr drivers/irqchip/irq-riscv-aplic-main.o
>   ...
>   Disassembly of section .data.rel.local:
>   ...
>   0000000000000130 <.LASANLOC4>:
>   ...
>        1c0: 0000          unimp
>           00000000000001c0:  R_RISCV_64   __mod_device_table__kmod_irq_ri=
scv_aplic_main__acpi__aplic_acpi_match
>   ...
>
> I cannot find much information about this ASANLOC outside of its
> location within the GCC sources, do we even need it? I don't see a way
> to opt out of this section altogether or on a per-variable basis, I
> wonder if there is some way to strip it out...

It seems from reading the gcc source that these are emitted to contain
information about where global declarations came from, presumably to
allow nicer ASAN error messages. (i.e. memory corruption affected this
symbol defined here). I don't think that KASAN uses these, but I am
not sure. I also don't know how they could be removed. I found a hit
using grep.app https://grep.app/search?case=3Dtrue&q=3DASANLOC in the
apache/nuttx repository where they seem to be doing something with
these symbols in a linker script, but I am not familiar enough with
linker scripts, or that project to fully understand what is going on.


>
> I plan to send the initial 6.18 Kbuild fixes pull request on Saturday.
> If we cannot figure out a real solution before then, maybe we can just
> switch to '--strip-unneeded-symbol' with a comment to upgrade that to
> '--strip-symbol' when possible?
>
> Cheers,
> Nathan
>


