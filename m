Return-Path: <linux-kbuild+bounces-10991-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDy9L8TEgWnZJgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10991-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 10:49:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3369FD7155
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 10:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48F65304DC92
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 09:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0C32C08D1;
	Tue,  3 Feb 2026 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="fyO8WkeF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9979B396D0D
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Feb 2026 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111955; cv=none; b=Jyv3IuZ0x8LfSLaR/75fOz9f0v0Vv4FTjxZwnIFkgJEMFgbmu+sGNWLrTFRc/c3D8mL02ouoA3rol5hd+Q4hFcYQjfSCG4l62oFYD7Ca1J+/pNFQQD4XcX/bcLo6eb2Qxbsj73hpjuIW3qJW3ugtr26SSeI09fSPXJeLXW8L0K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111955; c=relaxed/simple;
	bh=G7kvl2iXGoMXGm7oqHiym0vPwgOKWlq/tCoT4FaR768=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=iJGJxWgRAww8RLrIpo+M0vERKiIT4tZkPI48tvOrjma28+OvIEydb1j8JBXDGHP+QgoBMjFfIGB2uGgkCuEFXoUur8RcMdiMkxn6mKzaukBygA40gEs5vNrKpTNHg0Dq2GK371arEwlj4PDD4w3TQdRdO54INqNYnCBVjsl3tJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=fyO8WkeF; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To
	:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=reES5J+W+8DrIpUG4yVp96fM0Lx+QH7RckP1uZzjGBM=; b=fyO8WkeF2Ivl6gzbaVHN3HNIcx
	CrCtg6uBqLcH4OWZ4C2Js8l7tdg9FYtUXlTmvU+NiPE4SAqTBbPeC32PE1Ppk+0Fk0ycVBHXZnLd+
	SMgKvPo3AxeTWtv7UBPq/LQ8ZSZj3Mwb7R0CvgoEyEORpcj0O/qKGqkP+YocIU9dY64JC18JXoQI1
	NJbcQchczB8kKEhbU31iVEpxOvWAhiu7iTde3Zcrg1t4SlSeKdbfE/uDRdwWS2++XShYysvmCJ9xS
	4in4dsCw+LRyHKJWx9af7OSWuivcAcTvRDQsMY1VeY70+BMgBe1P8im/9PZG1mkXTEfBLODcIpyOl
	sLkdVLqw==;
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH V2] modpost: Amend ppc64 save/restfpr symnames for -Os
 build
From: =?utf-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
In-Reply-To: <20260203064800.GA701088@ax162>
Date: Tue, 3 Feb 2026 10:18:52 +0100
Cc: chleroy@kernel.org,
 linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com,
 mpe@ellerman.id.au,
 npiggin@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <99F903A5-F470-49ED-83B9-22D5963B25F2@exactco.de>
References: <20251123.131330.407910684435629198.rene@exactco.de>
 <d69d7167-00d1-49c5-90ee-6bc0b7e8295f@kernel.org>
 <20251123.160941.475051668667578407.rene@exactco.de>
 <20251123.162551.979799191208988118.rene@exactco.de>
 <20260203064800.GA701088@ax162>
To: Nathan Chancellor <nathan@kernel.org>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[exactco.de:s=x];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10991-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com];
	DMARC_NA(0.00)[exactco.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[exactco.de:-];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rene@exactco.de,linux-kbuild@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,exactco.de:email,exactco.de:url,exactco.de:mid,patreon.com:url]
X-Rspamd-Queue-Id: 3369FD7155
X-Rspamd-Action: no action

Hi,

On 3. Feb 2026, at 07:48, Nathan Chancellor <nathan@kernel.org> wrote:
>=20
> On Sun, Nov 23, 2025 at 04:25:51PM +0100, Ren=C3=A9 Rebe wrote:
>> Hey,
>>=20
>> On Sun, 23 Nov 2025 16:09:41 +0100 (CET), Ren=C3=A9 Rebe =
<rene@exactco.de> wrote:
>>=20
>>> On Sun, 23 Nov 2025 15:57:24 +0100, "Christophe Leroy (CS GROUP)" =
<chleroy@kernel.org> wrote:
>>>=20
>>>> Le 23/11/2025 =C3=A0 13:13, Ren=C3=A9 Rebe a =C3=A9crit :
>>>>> Building a size optimized ppc64 kernel (-Os), gcc emits more FP
>>>>> save/restore symbols, that the linker generates on demand into the
>>>>> .sfpr section. Explicitly allow-list those in =
scripts/mod/modpost.c,
>>>>> too. They are needed for the amdgpu in-kernel floating point =
support.
>>>>=20
>>>> Would have been interested to know with which version of GCC the
>>>> problem started.
>>>=20
>>> idk, maybe forever, or at least a decade fo GCC? Most devs probably
>>> don't build size optimized, and addtionally we only use in kernel
>>> floating point for amdgpu since recently? Should I add Fixes: for =
the
>>> in-kernel FP hash?
>>>=20
>>>> By the way you seem to fix the problem for modules, but does it =
also
>>>> work when amdgpu is in kernel ? I would have expected a need to add
>>>> functions in arch/powerpc/lib/crtsavres.S as well, just like =
following
>>>> commits:
>>>>=20
>>>> 8fe9c93e7453 ("powerpc: Add vr save/restore functions")
>>>> 7fca5dc8aa7a ("powerpc: Fix module building for gcc 4.5 and 64 =
bit")
>>>> da3de6df33f5 ("[POWERPC] Fix -Os kernel builds with newer gcc
>>>> versions")
>>>=20
>>> idk, I avoid linking that big stuff directly into the kernel and =
would
>>> need to specically test that, too. I guess I go do that now, too, =
...
>>=20
>> It appears built-in amdgpu FP somehow magically works for me:
>>=20
>> debug-linux:[linux-6.17]# grep DRM.*AMD .config
>> CONFIG_DRM_AMDGPU=3Dy
>> CONFIG_DRM_AMDGPU_SI=3Dy
>> CONFIG_DRM_AMDGPU_CIK=3Dy
>> CONFIG_DRM_AMDGPU_USERPTR=3Dy
>> CONFIG_DRM_AMD_ACP=3Dy
>> CONFIG_DRM_AMD_DC=3Dy
>> CONFIG_DRM_AMD_DC_FP=3Dy
>> CONFIG_DRM_AMD_DC_SI=3Dy
>> ...
>>  CC      =
drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_ddc.o
>>  CC      =
drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_log.o
>>  CC      =
drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.o
>>  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp.o
>>  CC      =
drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_execution.o
>>  CC      =
drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_transition.o
>>  CC      =
drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_execution.o
>>  CC      =
drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_transition.o
>>  AR      drivers/gpu/drm/amd/amdgpu/built-in.a
>>  AR      drivers/gpu/drm/built-in.a
>>  AR      drivers/gpu/built-in.a
>>  AR      drivers/built-in.a
>>  AR      built-in.a
>>  AR      vmlinux.a
>>  LD      vmlinux.o
>>  GEN     modules.builtin.modinfo
>>  GEN     modules.builtin
>>  MODPOST vmlinux.symvers
>>  CC      .vmlinux.export.o
>>  UPD     include/generated/utsversion.h
>>  CC      init/version-timestamp.o
>>  KSYMS   .tmp_vmlinux0.kallsyms.S
>>  AS      .tmp_vmlinux0.kallsyms.o
>>  LD      .tmp_vmlinux1
>>  NM      .tmp_vmlinux1.syms
>>  KSYMS   .tmp_vmlinux1.kallsyms.S
>>  AS      .tmp_vmlinux1.kallsyms.o
>>  LD      .tmp_vmlinux2
>>  NM      .tmp_vmlinux2.syms
>>  KSYMS   .tmp_vmlinux2.kallsyms.S
>>  AS      .tmp_vmlinux2.kallsyms.o
>>  LD      vmlinux.unstripped
>>  NM      System.map
>>  SORTTAB vmlinux.unstripped
>> make[3]: Nothing to be done for 'vmlinux.unstripped'.
>>  OBJCOPY vmlinux
>>=20
>> So I guess the patch is good to go after clarifying which kind of
>> Fixes: to use?
>=20
> Was this ever picked up or addressed elswhere?

Nope, still needs to be applied AFAICS ;-)

Thanks!

	Ren=C3=A9

>>>>> MODPOST Module.symvers
>>>>> ERROR: modpost: "_restfpr_20" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_restfpr_26" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_restfpr_22" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_savegpr1_27" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_savegpr1_25" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_restfpr_28" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_savegpr1_29" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_savefpr_20" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_savefpr_22" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_restfpr_15" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> WARNING: modpost: suppressed 56 unresolved symbol warnings because
>>>>> there were too many)
>>>>> Signed-off-by: Ren=C3=A9 Rebe <rene@exactco.de>
>>>>> ---
>>>>> V2: description
>>>>> Theoretically for -stable, but no previous commit that broke it.
>>>>=20
>>>> In that case you have to add Cc: stable@vger.kernel.org
>>>> Add indeed it is likely a gcc upgrade that broke it, not a previous
>>>> commit.
>>>=20
>>> Should I then simply use enabling amdgpu dc_fp and in-kernel FP as =
the
>>> breaking commit for Fixes:?
>>>=20
>>> Thanks!
>>>=20
>>> Ren=C3=A9
>>>=20
>>>>> ---
>>>>>  scripts/mod/modpost.c | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>>>>> index 47c8aa2a6939..133dfa16308a 100644
>>>>> --- a/scripts/mod/modpost.c
>>>>> +++ b/scripts/mod/modpost.c
>>>>> @@ -602,6 +602,10 @@ static int ignore_undef_symbol(struct =
elf_info
>>>>> *info, const char *symname)
>>>>>   /* Special register function linked on all modules during final =
link of
>>>>>   .ko */
>>>>>   if (strstarts(symname, "_restgpr0_") ||
>>>>>      strstarts(symname, "_savegpr0_") ||
>>>>> +    strstarts(symname, "_restgpr1_") ||
>>>>> +    strstarts(symname, "_savegpr1_") ||
>>>>> +    strstarts(symname, "_restfpr_") ||
>>>>> +    strstarts(symname, "_savefpr_") ||
>>>>>      strstarts(symname, "_restvr_") ||
>>>>>      strstarts(symname, "_savevr_") ||
>>>>>      strcmp(symname, ".TOC.") =3D=3D 0)
>>>>=20
>>>=20
>>> --=20
>>> Ren=C3=A9 Rebe, ExactCODE GmbH, Berlin, Germany
>>> https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 =
https://patreon.com/renerebe
>>=20
>> --=20
>> Ren=C3=A9 Rebe, ExactCODE GmbH, Berlin, Germany
>> https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 =
https://patreon.com/renerebe

--=20
https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 =
https://patreon.com/renerebe


