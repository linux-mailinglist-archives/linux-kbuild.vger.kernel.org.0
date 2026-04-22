Return-Path: <linux-kbuild+bounces-12854-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBQTI33h6GkHRQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12854-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 16:55:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7413F447966
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 16:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9A1C3058FA7
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 14:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CC03264F7;
	Wed, 22 Apr 2026 14:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bb1ShRys"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FEE30CDAE
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Apr 2026 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776869295; cv=pass; b=udB+MRi4cvq+pQbEdTFcM9M4q4MNHvBotIBdeVN/cB1/1MrVGcYX8RPj19HtfP2j26nNOrModZng0LNCRW2uH/pDHhYAVtOANskAyxyrTBm21PqrVYojCAAMFsyFyxL/HjPe+kdJOrYihjhCJRshXslyoygphBnz07SG9EDHxKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776869295; c=relaxed/simple;
	bh=tfnBijA/tHgHM0lSvhKY7uny8mkDHsaIhjWoI77S9Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyDXJLO3R4Am8/IZpi2ExfGkgm2D1OnzvXJPdPHoEeFIGdBR3qPcHOlqIW3vuXT+aHam4j9HkfQfGVNjcaUxEKh+5zsDtgq0DOGMiqMPkwjGriJ65cY7epZeUCOLwGZobUSq+P7sPAuS9uQKiFH8n1V73FQaer5IKQkgTfcBC1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bb1ShRys; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d734223e4so3842374f8f.0
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Apr 2026 07:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776869292; cv=none;
        d=google.com; s=arc-20240605;
        b=OKO7kmzObITt04cQ2uBdc8PSvA95EoL6HIDGTpWeJT7WVkyMj0rdMQgDJdXDk/s6xd
         sVc2RDV1aCK8Nvp8vEgZzyPFEBcASARnmr3NroLZvUl1Wj4WtAqoq6uoH48WkhoXcLqb
         r8vlNcximqJhnqnfa1HCUfgYd9XW294KXCaW/IF8AEDSvXMO/QovuXWbZ6mPyN4mnmhI
         rG7DVIh9pZiPSkmoeyQtJZHTRsjQrewzAYAlWfqh7MJmut7rwPDX3RYDB/OnHz3zPmoK
         gHk5VDbhdevqwi6C3ZOgf63Bvj6/fAK2pVGAcs4L/rcABIAj2FlxVB1Go3Se8yf6AaWJ
         nebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tfnBijA/tHgHM0lSvhKY7uny8mkDHsaIhjWoI77S9Es=;
        fh=MnNwHq7NBNj3iA7G2Zvl/Q0KMpw2f6Q7TMEiqNabm3g=;
        b=KLlz5MW97VDT5EXhH5tpMnCOSSq0yygLl2fXGh9DuRE3iv/x6QAKx3QODffPCKVUIa
         krn834tYwG5uoWYoosNMKxrhCmxgZBhS1oVG1yB+tohrIXimHbHJqpkV32Xw+pI8jjuL
         DmmV8G1Jd5gGGVy6EqhD1984Je5362816jN5v3O3o/DjBWYETwjInuEnaD/SoulhIFRT
         pvHEINjSAwRHEcdkxAhAgIfBvODCxNSxYjErLS3HfCKZ1kaERzRBkaQIPVsQfgd/mdTA
         rGzHbcVY6KUt2taGYLHvMOm3BIkTgOxJvvtGSEvnF6E2q5/xEeNLoYG1GSPSTUduvEYY
         W1tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776869292; x=1777474092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfnBijA/tHgHM0lSvhKY7uny8mkDHsaIhjWoI77S9Es=;
        b=bb1ShRysobJfv/guBXGH2tIQfvbJBdXF37+QGzOj6A0jZcum/r49058R8xu4XpGfk1
         MaxgLaeXFrngS6o48HliqwXVOUOhfWNflD3LXRspe9YhVzxR1AcbKW9pljOMbzeL4yxO
         vLVbWAB+nKgn90E85+kPvheBuhUPnNS2oTeBazDiWElY3wOKGCBl8C/NjbA5FnVcImRO
         RoUGscdYiQR64jcqkyKdaeY0RygSVzEu1xUW5ctXCsgYcHEt1MLusjO+28jwXtpMkMs+
         mf1oIo0UcRoDwuNgfN5Wgclg+XaMwQV5gOTBhEt5DEc1WEh4YdlZQmAbiBRpK+2odnY/
         b2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776869292; x=1777474092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tfnBijA/tHgHM0lSvhKY7uny8mkDHsaIhjWoI77S9Es=;
        b=eLtxTG7gQJDKNJZfkNr1Q/dm3upuTTHGgCuAHiuJ/GN9gJ2Ub7nmy7T8wt2FuHIL3T
         zvwzR8EM/ym4+6j+iTI1gxHJO81Tnpwsmta0PMJID+vB00wJv8thvGwdFiKwsRXFz0/6
         L1ezvGXziTxGT3zXlTAMTEYkdHVcKIkLhRDbnBv59vZyo2SxIAybf30epNg7Zo8PoSyu
         J5nJ6SUYv0enZ5LrEK7aGys8JlmVa5RUV6IBwMKLLCjmidH45dmzFp2gmnryChajPcG+
         JvVkP0ObbYy/3smEUjDW+9T0lNPZy6yHPzvzjjzLhLKToG69xIjaz813ouL9/GgOdXGq
         Gipg==
X-Forwarded-Encrypted: i=1; AFNElJ+C133pbQAGeC4HzgfILU41TK0kIzpMNVvPczsKYsy+6OFiLzzfxcpZG3PjzHG2/WN2xnFXq6W+esy2tdU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq5rQTVprhpAz7q7mec6kIXfuAQ0t3dD+U3XSaO0/8BtbvpNZU
	66hbK6gw8oANeF36qzCbzuymibAQmE94+CkfGBGBttzi222w4Oa1hCiuXd3Ic1maeWj2h5wUAkH
	PuthpOgZ8bUmleTsLfZ2gwxFajVfeUGk=
X-Gm-Gg: AeBDiet3wE7Nn1LTsO9H33Lg3hnbgDwsu5xKbBvT39FrUDpDJzPaVTy0Cr5UMAfo6bp
	H/Wbh8oiGn91/4R7ljDMJ5h3qkWZdd6mhZeQ6i7ZP1ASWQR0th77CyQxllNgrBQrBUVaBLNDfiX
	+6KXSnxvoZy1lCKOJwE5V+1l5mcAiORCn09iln2K3s3tnufC8ZSE76YVTL4EZNbobrpRwaPjzg0
	nTUeiVaveUgVH+oH/OkVl5kpp+X4r1+Rop61JFOT8hMr5A7eSQOzV54ZrgC8HF22zboSPn7lmM5
	8zc4CoeWvsBc1cXjQUL6SuAV/QNI2pphChYgklr6Lg86pkLsDtSiRhBCYujwYGoMXkUkNwIhkCC
	SfMGwSPpFGFxr/ZYsocuOtAefu1RV30b6LRPr
X-Received: by 2002:a05:6000:2dc6:b0:43d:7512:6f7b with SMTP id
 ffacd0b85a97d-43fe3f35785mr36196268f8f.5.1776869291840; Wed, 22 Apr 2026
 07:48:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <acLbnMAPrHCpoIpr@laps> <20260325011853.657295-1-sashal@kernel.org>
 <c7a8310e-501f-48a8-8ad5-0a40d8b3836b@oracle.com>
In-Reply-To: <c7a8310e-501f-48a8-8ad5-0a40d8b3836b@oracle.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 22 Apr 2026 07:48:00 -0700
X-Gm-Features: AQROBzA3qHbWnHv7v7Pdc9rqcoF99lBmBFrCQdAyyZbQ78QmK7wYiCIv_i6_yA8
Message-ID: <CAADnVQKshVai_srj_X_T-1AG3QH=VHymDO7Z4JowLcbC+jjReg@mail.gmail.com>
Subject: Re: [RFC] btf: split core BTF parsing out of BPF subsystem into kernel/btf/
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Sasha Levin <sashal@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, bpf <bpf@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Gow <davidgow@google.com>, Helge Deller <deller@gmx.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <kees@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-modules@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	"Luis R. Rodriguez" <mcgrof@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Petr Mladek <pmladek@suse.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12854-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,hansenpartnership.com,gmail.com,linux-foundation.org,alien8.de,vger.kernel.org,lwn.net,linux.intel.com,google.com,gmx.de,linux-m68k.org,linuxfoundation.org,zytor.com,suse.com,ideasonboard.com,redhat.com,infradead.org,goodmis.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexeistarovoitov@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7413F447966
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 3:44=E2=80=AFAM Alan Maguire <alan.maguire@oracle.c=
om> wrote:
>
> On 25/03/2026 01:18, Sasha Levin wrote:
> > Move BTF type format parsing and inspection code out of the BPF
> > subsystem into its own kernel/bf/ directory, separating core BTF
> > functionality from BPF-specific extensions.
> >
> > CONFIG_DEBUG_INFO_BTF currently depends on CONFIG_BPF_SYSCALL, which
> > prevents embedded, automotive, and safety-critical environments from
> > using BTF. These platforms often disable BPF for security and size
> > reasons but would benefit from BTF type information for crash
> > diagnostics and debugging.
> >
>
> I had a go at a refactor in this area too, and it's pretty tricky. How ab=
out
> we start with a smaller goal; making /sys/kernel/btf available to userspa=
ce
> on systems without CONFIG_BPF_SYSCALL? This would just involve a small re=
factor
> of the BTF module-related stuff in kernel/bpf/btf.c, moving it to btf_mod=
ule.c
> or similar say. No need to split out BTF parsing APIs from those actively=
 used in
> validating BPF etc, since a non-BPF_SYSCALL system would not need to pars=
e BTF
> in the kernel (just make it available in sysfs.

Small refactor is ok, but in general I'm not interested
in complicating code for systems without CONFIG_BPF_SYSCALL.

