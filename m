Return-Path: <linux-kbuild+bounces-13401-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNE+GMDLGGrrnQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13401-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 01:12:00 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCDC5FB3C2
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 01:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B541305D5F7
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 23:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306B636894D;
	Thu, 28 May 2026 23:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ID/HtU5g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A357030566B
	for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 23:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780009767; cv=pass; b=O2XszVkbBfmASTZShnNvVqd6WZIfY6NFDmkKXVggBFtbR0L1sZx6vMPZ05N0GMhDG/qzfHTg1k3iU2O8Zm7tHAMY1HBl8AAJY0GQj5rwWE0PoVUiSSuGX1OER4vst/03pPHgK6YBLGDVcsRvnxYGpG/dH46hBRuTfL7TSjcxBJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780009767; c=relaxed/simple;
	bh=n9u1n8p+Tyo28mHX87eTBmXAjGmSME8JGyFugekRIP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qUUJrHTeNMcxKjnKYz1hKaee+iA/at4XBIbb0GIN4VzelR7xS8ZMjX4eO5RtsOoP7WSx11jPHpDTkdy5PeXg+cM8kvoBleMc2khJ/A9p/0NwcP2ApJEbWX+Wle/arEpLdwya6+4qKAm7NFnXVolKcm/YNpwG+iXCYlIsy8IVE3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ID/HtU5g; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-516d6009380so181cf.0
        for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 16:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780009763; cv=none;
        d=google.com; s=arc-20240605;
        b=NacdmDUNioOwnqLYlyHN9E4q9739XmJESR9sCkasmM5wCYV73T8Bo6tVOKLYLPaHby
         TdAWlClusimYcrx6wKr3EE9LHUR7FwKnaigZgL0rmBYGg8+N4Y+GA3q5C+3wsJw+O6Ad
         B1xtg2LHXrCKnESJ6QkoHfWOMQXwtXv5lbKwEicKIKdIDMizi3MGTO3lYz//+xiuB8Sp
         OzbvlO+dA2NGp11bZw39C7YTgdGTOzdgVahODYGD+fF2s4dMAnUWM/liLbG6JTdRXz4/
         jV/dFGMNWUWO3ceMP/ahvz8jMVAD0j+D8lnVXEa5egZC1N6lIUft7wk9m3lF8xsE9Pav
         B+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BYEkysyj7nIsR4yyCUI7JyubCEenGV97AjOI+tlDrVs=;
        fh=/NVxAxaWrCsCQA+fCRihUNIfw7OXlo4a0Sw2mUQ8YKo=;
        b=V87CuJcH5pDrmXroWf1gOqoop81kUTjn3Vai4DJmSeFw1CIhq63Kyq4d+qcxZY4tAf
         2v77iqiefq6rWKMPv+txDnn+ZI5VZZQ8nrPGCkbjnA6TRHkKT2XIZWH1Kg6NMx2+rCMG
         9Ju6UmKLJPsgNE/c1sf7Qq7jYEyKHOi5Uko5Za/ZNAGHa+xc3xHqK/keDoUMeaBpI0wp
         0ZlvpNPnOFvXiqfvl/e9twOfyA6QrIUq9F34M19fZtB/H19eergJGtSjUj/9UK/uL0+E
         DBJu25J6E6mD8MDjvjb6GqjMChAm+1aoup6uKhqUzkgSEzi6nABzXke35WscnWnhR1ki
         Mn1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780009763; x=1780614563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYEkysyj7nIsR4yyCUI7JyubCEenGV97AjOI+tlDrVs=;
        b=ID/HtU5gnjd3uQdIY/ecq4P7PedArT4rUed84E2HXYWh9CCYDgzy3vKDyoCaoEZ3vL
         jU8HwcSQGW2XGHWcFglFLI1CyHn+lP0EcPc3gODdeeZiWuYnkLZgkxSBpYuRBUGdyYpY
         6KjpOAJ89xPKIRrv/nCspQP8xquE5+IOPkyTWkSaByA8crrcw7JP/14kB/sOHoeexkNs
         zk+eEEXtsim7nrXRGkuhU/xmeVoNP8+XfIWWv3BbdK8P8PBYc1A0ngoburc8YImHFnt0
         TfBiBZfr2EgeK1IzMkw34NiUxeOW4N7RpQ6dNpYNZLx4DPRInMrsKDNmjOdWuL+4t/x4
         QruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780009763; x=1780614563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BYEkysyj7nIsR4yyCUI7JyubCEenGV97AjOI+tlDrVs=;
        b=I3qywk29EcAfuxk417UiAATuHKg8b80OxqwtWAMsPnV5ovx44sicOwvfuGEFgDDWSj
         bNh5QDEakYTeDX6lO9hqSit0hvDpNPUzCBo36uL+S0DZ3VKshFUDwgvos+sohCq72Em8
         bCDmtfEEY+6W48SA3POBA0QncAz3Pr48wdXC1c5ksHtDfuTEosIDj7cVt8BxWC3JE4yG
         gGSR7X+TUAwXX3jLulLeOupzhwbSBH0fRIVBeCY2+2nQH6ue3hLLLOKpHj8PymTAIZKO
         uMTJAFxG/pi+Xyu7G7t84pubRRmoifWwG63t14H3BNwXpqQWHtniijVgwjvrtm8q+78j
         TlWg==
X-Forwarded-Encrypted: i=1; AFNElJ9orEjstfzbMHufH/OltWHO/TvfQtCt0ylwyo9pdtIX6ui0ziy00AutfaGYwKG8mD+5dW6lebsd65YoMp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyENrbgvssV98TVule5Ok0DkzhftlzmeprHJdrz9g4pRdlMrvm+
	ukfQoOBOmb8FDAfe9W8GXXC9pYOzAC/nzFMjTdqxEhQhAtCAPAmYSOSIi5hpbD0W67j66feElnt
	LJK+XeasLS5g2Uw8MbqUJsVx3VCRqLPRIHGGVRPo4
X-Gm-Gg: Acq92OECaEtSvNrzpGdBMYuCr5ZKCeytkWneB3YXHPEd9UQ0fmnJPcecJrsmmkEtzzX
	CRPYzlz0LdIQXUiRHyUoUOlgqVVLe0HHIGGd/yzR9Ds/sArAuEvUaM41jHmRLuk/6jGwPRIrDBP
	S2XEStCaYDrMW4rrKSuWXz23xUBJ9GeWweX7E4oZLwsxfT3aZZanLUqjLoxjag1NI8cFs1soq7S
	O6adyDF9ro1WVitAKNGBiSRysLP4d1AlDN3rzHVJ/uUO2p/hrJf7nhbzkVplgST7AczK8x4EDsw
	YeNTHnnSg/PRUdefmE390JCPxNrAjwhDcoCaaNfCLCRFdFXK
X-Received: by 2002:a05:622a:6015:b0:50e:5eba:cadd with SMTP id
 d75a77b69052e-5172dd8515fmr1560491cf.2.1780009763142; Thu, 28 May 2026
 16:09:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528203905.687687-1-xur@google.com> <20260528203905.687687-4-xur@google.com>
 <178000602351.678078.3534988919326810792.b4-review@b4>
In-Reply-To: <178000602351.678078.3534988919326810792.b4-review@b4>
From: Rong Xu <xur@google.com>
Date: Thu, 28 May 2026 16:09:10 -0700
X-Gm-Features: AVHnY4JIDHpOjLDIlLr5JYWP7b43uKz_Jmz2J99OCwuQqa1ufv57jDGJFyMD0T0
Message-ID: <CAF1bQ=SOG3qr4K3h=SBgM=e42RmV6WjOfyMOmi_qBOpYMoVaEQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] kbuild: distributed build support for Clang ThinLTO
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13401-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,sashiko.dev:url]
X-Rspamd-Queue-Id: BBCDC5FB3C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 3:07=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Thu, 28 May 2026 13:39:05 -0700, xur@google.com <xur@google.com> wrote=
:
> > diff --git a/scripts/Makefile.thinlto b/scripts/Makefile.thinlto
> > new file mode 100644
> > index 000000000000..408b63786a08
> > --- /dev/null
> > +++ b/scripts/Makefile.thinlto
> > @@ -0,0 +1,41 @@
> > +PHONY :=3D __default
> > +__default:
> > +
> > +include include/config/auto.conf
> > +include $(srctree)/scripts/Kbuild.include
> > +include $(srctree)/scripts/Makefile.lib
> > +
> > +native-objs :=3D $(patsubst %.o,%.thinlto-native.o,$(call read-file, v=
mlinux.thinlto-index))
> > +
> > +__default: $(native-objs)
> > +
> > +# Generate .thinlto-native.o (obj) from .o (bitcode) and .thinlto.bc (=
summary) files
> > +# --------------------------------------------------------------------=
-------
> > +quiet_cmd_cc_o_bc =3D CC $(quiet_modtag)  $@
> > +      be_flags =3D $(saved_c_flags_$(<))
>
> This change...
>
> > [ ... skip 20 lines ... ]
> > +prereq-ir-objs :=3D $(targets:%.thinlto-native.o=3D%.o)
> > +existing-ir-objs :=3D $(wildcard $(sort $(prereq-ir-objs)))
> > +
> > +-include $(foreach f, $(existing-targets) $(existing-ir-objs), $(dir $=
(f)).$(notdir $(f)).cmd)
> > +
> > +.PHONY: $(PHONY)
>
> ... and this change appear to break the build in certain circumstances.
>
>   | $ printf 'CONFIG_%s\n' LTO_NONE=3Dn LTO_CLANG_THIN_DIST=3Dy >kernel/c=
onfigs/repro.config
>   |
>   | $ make -skj"$(nproc)" ARCH=3Darm64 LLVM=3D1 mrproper defconfig repro.=
config vmlinux
>   | ...
>   | warning: linking module 'virt/kvm/coalesced_mmio.o': Linking two modu=
les of different target triples: 'mm/slab_common.o' is 'aarch64-unknown-lin=
ux-gnu' whereas 'virt/kvm/coalesced_mmio.o' is 'x86_64-unknown-linux-gnu' [=
-Wlinker-warnings]
>   | '+v8a' is not a recognized feature for this target (ignoring feature)
>   | '-fmv' is not a recognized feature for this target (ignoring feature)
>   | '-fp-armv8' is not a recognized feature for this target (ignoring fea=
ture)
>   | '-neon' is not a recognized feature for this target (ignoring feature=
)
>   | '+v8a' is not a recognized feature for this target (ignoring feature)
>   | '-fmv' is not a recognized feature for this target (ignoring feature)
>   | '-fp-armv8' is not a recognized feature for this target (ignoring fea=
ture)
>   | '-neon' is not a recognized feature for this target (ignoring feature=
)
>   | <inline asm>:1:2: error: invalid instruction mnemonic 'dmb'
>   |         dmb ishst
>   |         ^~~
>   | 2 warnings and 3 errors generated.
>   | make[5]: *** [scripts/Makefile.thinlto:22: virt/kvm/dirty_ring.thinlt=
o-native.o] Error 1
>   | ...
>
> Looking at V=3D1 output, the backend flags are missing from this object
> and the other ones that errored. If I revert back to how you had it in
> v10, the build is successful and the flags appear to be included
> properly.

I think this error from the relative path issue: I have the _c_flags as:
"saved_c_flags_arch/arm64/kvm/../../../virt/kvm/coalesced_mmio.o"
But in the backend compilation, I tried to load
"saved_c_flags_virt/kvm/coalesced_mmio.o".

I think I will revert to my v10 implementation here.

>
> Sashiko has another comment as well.
>
>   https://sashiko.dev/#/patchset/26003?part=3D3

Are you referring to KBUILD_VMLINUX_OBJS and KBUILD_VMLINUX_LIBS part?
I'm not sure if that's true: in my build, KBUILD_VMLINUX_OBJS includes
lib/lib.a etc.
In line 1296 of Makefile:
KBUILD_VMLINUX_OBJS :=3D built-in.a $(patsubst %/, %/lib.a, $(filter %/,
$(libs-y)))

We can see native objects in lib/*.
% find lib -name '*.thinlto-native.o' |wc
    204     204    7104

>
> --
> Cheers,
> Nathan
>

