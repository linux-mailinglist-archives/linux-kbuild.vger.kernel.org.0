Return-Path: <linux-kbuild+bounces-1597-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6518A7C8D
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Apr 2024 08:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 401701C20DB2
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Apr 2024 06:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC80657DE;
	Wed, 17 Apr 2024 06:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="CIwohlhs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sonic310-19.consmr.mail.sg3.yahoo.com (sonic310-19.consmr.mail.sg3.yahoo.com [106.10.244.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6750165BA8
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Apr 2024 06:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.244.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713336645; cv=none; b=grMT7JJL690dqJ50iTjgQtIgTMxSs3R5Oh0kfrWIToXV9g0Z6eUzCn3DPe9gdEdECJWWRsT4tw5+Lj2heGrhbmfQPeUsebMyOz4BiJ28LAifnDBQK+/aQ9fnxDnHySOlGvznfDWPZkGO1Qp2kh4qonnu+lWEvv+idwofHkcKre4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713336645; c=relaxed/simple;
	bh=P/6VlkrNHL+DWLjDi13OuCnRh2ktan9hfcmYEzQ6VfM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=DJ3AdVmdb0r0VjRgJHD+oGhe4ZhMMd48In67IcCN4m5WibyI5TKCeXbvTIPFdJVaDzxg+r7PXnWZTOMauXdWreHIV1PQvZjDjIpdSBUa56EeBRsWT40oJaGyrnD69iBoOwtCm5KtmZMBMPkdGM9XQY0c0+xqbXuB+8uE943DAAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=fail smtp.mailfrom=fedoraproject.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=CIwohlhs; arc=none smtp.client-ip=106.10.244.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fedoraproject.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1713336640; bh=P/6VlkrNHL+DWLjDi13OuCnRh2ktan9hfcmYEzQ6VfM=; h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=CIwohlhsmK4G0fv6gQVP6akgd+jTu3brIN13HHhzBR6wZC2Trhb2lTQjlNqZcHITrjXsAtqYdPHxN4VK0qUuVLFuhHTnR4TyC/qXGQ+dZRxXEf00i7tAp2R5qEd4VyPnJvBvIdGSl4GBCgc7tXNoR3GJvgCUPPg6WaKuiy3ZsM3AjR+Yje2XVs2Y6bwTNaJegCA2M9E7nzJTmF7QGUQkZPrHX/wMW6rkD2lAyJcFep/Jlo/FDKhVWV3sjaF9PBJyeOqXu0hnQh9sAzJPw2Ee1rs6NugLmttCN6ImJq/uHt0hL8cUP2dIXa66/MK+2Vwkigr78nfk1oFw6mfhZy7Qig==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1713336640; bh=Deuw+QRxY65NA6GuyIZq84D72K92JglfGBrUCY5UiMQ=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=XI0sHALu+Sg+HahfxnPolwYXYDmEBjIONcO8HHiq25dCYVRnqHYc/1QRPinWEQrJ/GY3p7J6X1HKdbnMpD2tiqNP2nKYPRLpaslkgNy1MUnfYAcoIm8iZGE8YU3d8qILfbqzh5ch273t1Fqn8mnK+QRzZcc/eIsuGE4iXddKMGXSGSY+61yV16Y1UXUIlzaTSGVY64WCoDbtnmFv3gBuneaFRFRQXYfjUNf94Wdn4kIb17Zuy036o44Cq+gqRan0PmfZC71LZL1cav9Yu3NusC5v9bhcDvP+MbVkfaFOXO7qihR0iO1j2mP6B+CARfapSdB/BmkfWCg+0ZJYXlnqsA==
X-YMail-OSG: GEGIefcVM1kUEzZB7f6pzf9t8j2LH9x6X_BwGNuyYHF0GnoYFvWdDcChZgD8V0m
 x6zirxg6oXa8_sOPLXiYO6yiR3ggDLk4YD3CCzn2lNOd6PRBNx1k8qtcZ.CPXh.LgZYtEyrP6udC
 KZ0vo..E8kxzOp2X2W6tN6ML.v7BDgV.QzPuGJButG_4Aoi_W1ChM1rIChZoUavd6nQS1NgmhQDH
 YimPqMwClxUiQ0OXyLPnbJBlBPzn1mOzfyUXHG03lBYReL07GSHi_izuiuxoAbOc6xeim1leYsyq
 mVj8l855sIlCabL8cArTtafaJGXQKPQt_4qlLdRKGVmdBFkvXTE_8ICCYEPJVopxYbDsWZ56Guq9
 ICgujthVslwfl8GqiLSUvXY6bP3evOuYoHJOiVBe4QPkr0a2QdI6ffL_NtSFMJ7EhRpYgvY86T9i
 CGrr5tzezOGkHerAKdOGKXOBd.X1Wzp7z0Nl_.MslmePRX8f8w5vT6v.kqFIc8eD2HEIOoemtM1.
 YCU6UEl_lzNwh0v3WD2YxA3B.25YS0WgcwI_ZGqxxY1WnLeJydnjStv5YWMeQ2Qt7pqoKDpMZO.2
 c2cUfVhM3LKxtglHSPd2s5WlfTVGFrViSZKnwEaD4HxS3X93eDnJtiCeHmu7x4JDHwUbBqKSgsle
 AEveZ51yAloiCszth.JM9B7vDIMDheIb0zzpSfic1558OhCJPdVqMiI9alF7Fit_NwOa3sRlRbPC
 zKM7byoDy5SY_LBQ0j3QtLyaDXlocCpOe.VCs7HOrkaDDTC2E8CHHsTK3TyWALNmx72w0FRUj8M_
 SUteV5cdv83BBaiiH3bKNuJ_tUrSQ8cJnv3mOPjWcFi.LhwkGeRzIxlc71t7POKr44wcaIeEXK7A
 FmZL.S6OyQ9TkP6UdmaQ_G.eth_xkMxGo.fABHfDwPs054UDAYyDnUAfQnX14Y2TqWGTWLKa2qoH
 FEOPhHoA8MAOWcwV6FHjeoGlejUEzoSbDxx7Q_Xt6.x37K4_RvnZQC0TYaBz6by0w8wL8rwhUhQj
 N9DfdOaMltoaZpgho0U26wBeiVQI.eiokR1FEGqPLY8meoerv.xBL5Mq6iRyvjM.KokN29PG2mU7
 mjZCzXDtuG6oUqFIAqUokGdKTi4nsDQhC.Pz37i_cSEGHZ.An3aeSYHCVodRcqkHmCe59MFIOyVs
 cqaUSGF430wwUuUVxSbjYk21FYu.AxO54W40y6ymqyZG5HTrNWgScMGjxYBkjNpEQxitE5LSDphF
 23s8VLeI5MtBUE8FalCGgfJkKHkGakddy8iypKsVsprbJ6YNtRjs1qrh0GyXWl0yfmAaMXpEJ37C
 1gMcOhO4wYB11KzKSpTHtGjgO85aND51FMIxv3upsa2RmVJn8DAz0XNw4hJN79ZBinsPGoFpWzmB
 NFrDfyPlhwA_vWNRWkYvlSmBOoFajGwV0QO2rve_sLDeY1XucpW0d0.2g8wwItgMDVX2cAqh..Db
 brK5sjVrMnTMqeRh2OIQzOR2aovKjsdGqHhhdW4jJgAcRUT0nd7456HXH0JJ4WN6MpJLv1Jl_jFh
 lrmYjw9f9dvazY9hNC6ex7v4ocU46Kz4S0XFlw99mMYI07yHaD1DsX2be88ezd9AkH9wyJ3HxlNV
 qhDjpZoJUG_iWOoo46Bib5YmMOCG4z09qX_IFLxs6xY5_RdKRu8e3ys_Xpa5iNv7n.U4JFMKMiBo
 _5fGyoa2o.Xm0QwAzyrN_Tq5KTPjCi35xLp5fOocvPabLlsRxlLVZEA1FRa77q7deCaUwmM7_Zet
 znAzlg02wFuix_zoLHrGSzUhZQmw.rSuGDTb1ojm.USorPmdafWxGEIDW9P6VSNtRc1LifMbDn0j
 _aW83AinQXtdCEDC9Oz_nI52yB7CI76fOL_U7UaKFHOu9zXWAYBQf59Pj933P70jybTn8ddwqPbS
 pkZuF5yXXzX0VfiMD161_L4.scVCR8M10I2uzrIjORlrsoU97LH.KwS4x8Tzmu9VPFjQMDJrZ.Av
 Ec.B43WBfsHqD3X8MbrAo8rirLirXNAa3WLmf1EjlgYe6TFv2y8Zh8fdH_KLOiDWqmf7R_q8PGgD
 4UwT7Cf8K27z36SDha6bYGOVZkhWo9P8eVa7EOpNiIt0z92Ko4DvK_RRSV69SrxrP2jH3FwjtC2t
 63UQRlUEnouPdL4dRVRDtVdqMiZ28K4wTVgAY8BNZelH1BQA7w1jp8mV6.d6z.1YyduwsJhJvTyb
 aObDLtcIXBTzCOd6aISvM0Yg44KfdpuH.TBdePx0J52Z.zqVBfyQ50ihVvIKnlmIN
X-Sonic-MF: <pjp@fedoraproject.org>
X-Sonic-ID: b5fbefc3-e8f3-4f09-bc86-bc847e7859e1
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.sg3.yahoo.com with HTTP; Wed, 17 Apr 2024 06:50:40 +0000
Date: Wed, 17 Apr 2024 06:29:29 +0000 (UTC)
From: Prasad Pandit <pjp@fedoraproject.org>
Reply-To: Prasad Pandit <pj.pandit@yahoo.in>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Message-ID: <668901914.114470.1713335369416@mail.yahoo.com>
In-Reply-To: <CAK7LNASZR=n+T=9Lo-5=Nw9WTwY9ywdTNvAUdt8xDXxsnNu3Tg@mail.gmail.com>
References: <20240407072933.3562124-1-ppandit@redhat.com> <CAK7LNASZR=n+T=9Lo-5=Nw9WTwY9ywdTNvAUdt8xDXxsnNu3Tg@mail.gmail.com>
Subject: Re: [PATCH v1] kconfig: add config and source entry details
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.22256 YMailNorrin

Hello Masahiro,

On Tuesday, 16 April, 2024 at 05:19:40 pm IST, Masahiro Yamada <masahiroy@k=
ernel.org> wrote:>
>You added
>
>- indented by a leading tab (\t) character,
>- Help text is further indented by two more spaces.
>
>These are recommended coding styles for readability,
>not grammatical requirements.

=C2=A0 ->=C2=A0https://www.kernel.org/doc/html/latest/kbuild/kconfig-langua=
ge.html

* I see, thank you for the clarification. Reading this language reference a=
nd seeing the config entries consistently using indentation in Kconfig file=
s, I mistook it as language syntax.

* Maybe it'll help to explicitly specify that indentation is not the Kconfi=
g language syntax.


>You can write Kconfig code without indentation,
>without blank lines in-between.
>
>
>config FOO
>bool "foo"
>depends on BAR
>config BAR
>bool "bar"
>config BAZ
>bool "baz"
>
>
>It is unreadable, but it works fine.
>
>
>Only the place where the indentation plays an act
>is the end of help. It is already documented.
>
> =C2=A0The end of the help text is determined by
> =C2=A0the indentation level, this means it ends at the first line which h=
as
> =C2=A0a smaller indentation than the first line of the help text.
>

* Got it. In that case, to confirm: are there any input cases which are err=
oneous according to the Kconfig language syntax? Because even config entrie=
s ending with an 'EOF' are not flagged as an error.


* Last to confirm: is 'kconfig-language.html' reference for the Kconfig lan=
gauge as implemented in kernel OR it is the general language reference that=
 applies to all Kconfig files across all projects? Because non-kernel proje=
cts also seem to use Kconfig files.


Thank you.
---
=C2=A0 - Prasad

