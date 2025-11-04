Return-Path: <linux-kbuild+bounces-9403-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BEBC32EF6
	for <lists+linux-kbuild@lfdr.de>; Tue, 04 Nov 2025 21:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E766189E7F4
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Nov 2025 20:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BC21DD9AC;
	Tue,  4 Nov 2025 20:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=surgut.co.uk header.i=@surgut.co.uk header.b="YxjhuJFW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295E02EDD49
	for <linux-kbuild@vger.kernel.org>; Tue,  4 Nov 2025 20:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762288572; cv=none; b=l/Ojvvt0MLkRX+XM3HjVCfC0oLpnHHIulw4VR1dxHbJ3NdOsyzETYu9tdvtSMOH/qQABGOA+K89Mumu1Rg7tiQjLUzu5itWrnFe+Sw2kj1EGZOZ9i3XTMgbkObIKSkfxW21NVk3Hsfz5/phfi3pKYRbTWM2JedsawKAYbpakiag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762288572; c=relaxed/simple;
	bh=vxA5as3F+lzIkbjZoE25VaCH6OX9D55HxqM93oYJUXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YfbkTu+GJTSqMMBQseKK0aLaW32V2tBKdeUbR8TaT5pyxqk1f0xa/OpkXPIwsjKC+SB+/o5skWpBIDSEHxv6xOBeK00W6OHMllXjWc7OhEjTozD4DNP8OJR+rEMAkRJfUaO7wY4JStMa/xOow5sm+G/3/drmvxbwJCNUwtthW9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surgut.co.uk; spf=pass smtp.mailfrom=surgut.co.uk; dkim=pass (1024-bit key) header.d=surgut.co.uk header.i=@surgut.co.uk header.b=YxjhuJFW; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surgut.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surgut.co.uk
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b70fb7b54cdso271772366b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Nov 2025 12:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=surgut.co.uk; s=google; t=1762288568; x=1762893368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNwxBRLVn+yjNsddWZjaRch63cYGP209xDEv1WXxmfA=;
        b=YxjhuJFWReJ64PHoyNW8a3tl/zSENRnwD6jEJKFUpyZ0h4X4/k5MO+yWkYSTNIFMJP
         izhZWW2WuafSadbjp9uXn7M6ohgc7ikKiJgRujsQZKebp9QrIhbu04KJuJ5YweMKJG7y
         dvdoRrvCHi+ft11dv3aYLR7qlGf/4/3YaS06I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762288568; x=1762893368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNwxBRLVn+yjNsddWZjaRch63cYGP209xDEv1WXxmfA=;
        b=Xb6YadC11MYn1OoIGDLoOwU4GXALKS9DgIz1vWOqBPRQI+p+VyzajVLA5gvLd1X4QE
         jkfzpMd+iSq45Jd9UYkV0SLsWoCB4KbGa33N8I74xeBagKzmp/u5CRNaff8kd3fNkpUZ
         zNy9DQzow4MLmYsHBmREc5q1Cjr/9p1yMT1LgkrsPrxIXq0NVuEw2bPoGM+t7krmox1Y
         aQcvO1X6QPsoibvKRxa0IBvSOzBjSJktSfBhl6mQiGh0OOvyLoic8LlcROsPLgscjMSU
         wVA06gqas1UcuUXVn4Ke3GNKTFwxSc92qjvh7D/dPDuoK6TMZVOofmiqhaRx4717zvSI
         rVcQ==
X-Gm-Message-State: AOJu0YwFoDLCJcPZo49t1ORXp4QVe8xLmjyC2vKgJqNe6kuYxp36k0LB
	g/yFBWw8TIAqs4xMXXUDMeNyKQj4ENKEJwkTQ5Kzw+o1Vp7ltob5CUK1jiSqKFK5nsB4wCXrG5Z
	KJVVBXyLNe5GzpR0mLyngnDLCbrB2XPD+Qo+nZIcly22sdQA5Po/osHU=
X-Gm-Gg: ASbGncuwy6Vb0BEOcgviINU9KN2HHXwOJtBJl3MLq6JyRSqWXAWKWnpYpaQKc46A6uF
	UGBQ7Tr5nMfJJN+puRFgRwU3PC632X2bfTm0/+HDAibatcIIDTHZ5X0QJhqMRNp0+SGkVUomDJ8
	y8ZClrkSlL5pqky6W3UwQ4ia4sSob755c9FemHtNWSZ5KrlFiUbrfl+HlahLpngxIrDJz+kS6Dr
	L0Y9ShO10kcQpJJ/3P3s5EQYHZujZSqInG+MSX6dzKL4/nLNpioyURmtne+lxXoTf986Hto/08B
	UR00rJ+HrFnlY8qeas/Hnt6W+14Q
X-Google-Smtp-Source: AGHT+IHv6MdLvjnzllIsscePyeEHR6x4pXQN16s0CZlQrgp3UqARDV08ZSSUX0hcwSQAb/R4xgOEgL2WxyZLFHbFBvI=
X-Received: by 2002:a17:906:6a08:b0:b71:edef:b1d5 with SMTP id
 a640c23a62f3a-b726515d4b4mr53315666b.11.1762288568344; Tue, 04 Nov 2025
 12:36:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
 <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com> <aQpCE_XTU-bZHFbk@telecaster>
In-Reply-To: <aQpCE_XTU-bZHFbk@telecaster>
From: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
Date: Tue, 4 Nov 2025 20:35:57 +0000
X-Gm-Features: AWmQ_bnvWh1e0XqPfSnGn_fuTx1oqRO8eoa0E4M9C5uYfyqYXVvrzikkIncqudc
Message-ID: <CANBHLUhJ5UVsN4-JN2PG=jq63yGttB9BD6Qm8MgvYirTvg_stw@mail.gmail.com>
Subject: Re: [mainline]Error while running make modules_install command
To: Omar Sandoval <osandov@osandov.com>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, 
	Samir M <samir@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 4 Nov 2025 at 18:12, Omar Sandoval <osandov@osandov.com> wrote:
>
> On Tue, Nov 04, 2025 at 04:54:38PM +0530, Venkat Rao Bagalkote wrote:
> >
> > On 04/11/25 4:47 pm, Samir M wrote:
> > > Hello,
> > >
> > >
> > > I am observing below error while running the make modules_install
> > > command on latest mainline kernel on IBM Power11 server.
> > >
> > >
> > > Error:
> > > DEPMOD  /lib/modules/6.18.0-rc4=E2=80=A8depmod: ERROR: kmod_builtin_i=
ter_next:
> > > unexpected string without modname prefix
> > >
> >
> > IBM CI has also reported this error.
> >
> >
> > Error:
> >
> >
> > depmod: ERROR: kmod_builtin_iter_next: unexpected string without modnam=
e
> > prefix
> >   INSTALL /boot
> > depmod: ERROR: kmod_builtin_iter_next: unexpected string without modnam=
e
> > prefix
> > depmod: ERROR: kmod_builtin_iter_next: unexpected string without modnam=
e
> > prefix
> >
> >
> > Git bisect is pointing to below commit as first bad commit.
> >
> >
> > d50f21091358b2b29dc06c2061106cdb0f030d03 is the first bad commit
> > commit d50f21091358b2b29dc06c2061106cdb0f030d03
> > Author: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
> > Date:   Sun Oct 26 20:21:00 2025 +0000
> >
> >     kbuild: align modinfo section for Secureboot Authenticode EDK2 comp=
at
> >
> >     Previously linker scripts would always generate vmlinuz that has
> > sections
> >     aligned. And thus padded (correct Authenticode calculation) and unp=
added
> >     calculation would be same. As in https://github.com/rhboot/pesign
> > userspace
> >     tool would produce the same authenticode digest for both of the
> > following
> >     commands:
> >
> >         pesign --padding --hash --in ./arch/x86_64/boot/bzImage
> >         pesign --nopadding --hash --in ./arch/x86_64/boot/bzImage
> >
> >     The commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
> >     vmlinux.unstripped") added .modinfo section of variable length.
> > Depending
> >     on kernel configuration it may or may not be aligned.
> >
> >     All userspace signing tooling correctly pads such section to calcul=
ation
> >     spec compliant authenticode digest.
> >
> >     However, if bzImage is not further processed and is attempted to be
> > loaded
> >     directly by EDK2 firmware, it calculates unpadded Authenticode dige=
st
> > and
> >     fails to correct accept/reject such kernel builds even when propoer
> >     Authenticode values are enrolled in db/dbx. One can say EDK2 requir=
es
> >     aligned/padded kernels in Secureboot.
> >
> >     Thus add ALIGN(8) to the .modinfo section, to esure kernels irrespe=
ctive
> > of
> >     modinfo contents can be loaded by all existing EDK2 firmware builds=
.
> >
> >     Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in
> > vmlinux.unstripped")
> >     Cc: stable@vger.kernel.org
> >     Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
> >     Link:
> > https://patch.msgid.link/20251026202100.679989-1-dimitri.ledkov@surgut.=
co.uk
> >     Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >
> >  include/asm-generic/vmlinux.lds.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> drgn's CI hit this same failure. FWIW, the commit fixed by this bisected
> commit, 3e86e4d74c04 ("kbuild: keep .modinfo section in
> vmlinux.unstripped"), also results in ELF segments of size 0 in vmlinux
> for some configurations, which confused drgn until I added a workaround
> (https://github.com/osandov/drgn/commit/2a9053de8796af866fd720a3c8c230135=
95d391a).
> So there's some funkiness in this area.

The expectation is that said section is removed from the final binary.
But the fact that it is present with 0 length, indicates incorrect
linking. It also now makes sense why on x86/arm it is tripping up
section alignment.

As it is likely that it is the same underlying issue that such segment
exists in the first place.

I wonder if the original implementation of moving sections about and
when/where the builtin module info is kept is not as tidy as it was
intended to be.

I wonder if we should:
- rollback to the state of how things were before that feature was added
- keep the production / stripped / installed kernel build as is
- reshuffle of how modinfo is preserved in the unstripped kernel with
a bespoke linker script

Such that hopefully we have correct alignment, without any zero length segm=
ents.

Or possibly even link / split the built-in module info somewhere else entir=
ely.

As in revert both:
- d50f21091358b (kbuild: align modinfo section for Secureboot
Authenticode EDK2 compat, 2025-10-26)
- 3e86e4d74c049 (kbuild: keep .modinfo section in vmlinux.unstripped,
2025-09-18)

And try implementing the keeping of .modinfo section again.

Better structure tests, after linking would be nice to catch such
issues, because linker scripts are hard and trying to understand how a
linker script change affects the result.

--=20
Regards,

Dimitri.

