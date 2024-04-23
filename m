Return-Path: <linux-kbuild+bounces-1663-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 054118ADD96
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 08:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B505E1C20C9B
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 06:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E24D2208E;
	Tue, 23 Apr 2024 06:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="LWrjAzrL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sonic309-21.consmr.mail.sg3.yahoo.com (sonic309-21.consmr.mail.sg3.yahoo.com [106.10.244.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8F717BB7
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 06:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.244.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713854508; cv=none; b=lJ4LoCXHac/XhLntzNwcfBm+HWmOige/Zu6belkw93GpmrmRJ5WnUW7oXwt18OrF4kZEuGIK7wzN+C60KnUXsl/VwlQCs8hAtG4AVHpaFztt9kPO+XoD1QDyllTFUwwQ2G1YA+vLFyqI5veKjupgd2NNwbNKV71D6psxnBPf64M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713854508; c=relaxed/simple;
	bh=JcUzwVVut0TEozeDL3Ud9BNaSxZKQdLtJdQRYDxHhMI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=qvF8pnQwn48o+jXuK4n8cj4vpyvSCcq26llOqHg0XV7CN3Igvhf9/OaGk5t1q1A6RAF8JjprW2Yvl2/sWgN6i7bWQdACECsFF6Rzn2mkzBj9AyWkS/X0C7WwCrFuJy/M6c65jfSlIFdcfsrYbmFUJlkuJZFV5foFMTtXPdTY2q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=fail smtp.mailfrom=fedoraproject.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=LWrjAzrL; arc=none smtp.client-ip=106.10.244.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fedoraproject.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1713854497; bh=JcUzwVVut0TEozeDL3Ud9BNaSxZKQdLtJdQRYDxHhMI=; h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=LWrjAzrLVnuX8vmCQNdDiKkckxdsogu63tb3WueWHgY1SGFLChE9hfdQvnmGwyMEXlIQ9agV9jkwbuhGZXFz315YvshsvNo4R7EX4bU6NUIj3UrF6jAD+29CShBEeuKc0W0SOtPMONJw65pP6vZ0fy9TlqrtLA9oP/bI3+TvKLh14ygETmbI7dGYYBBw+kPfxZ7BrqLDD2AcHLYfUwh4+f3LP9esQ2f5PZZ+RZRWVICXY6tNpqUDyyaGT01FChM74rUP7oQuYjZNXQWd4xY7od+pLTcg4e1wk+k06Pvuv2YpC5ggLHplSu02WHo+yJVSxdnG4rJuhhMUsJnUtD2KoQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1713854497; bh=JKVwxVylh4iaGEKrjWpDjoTpUhTa+u/2HyyHEl9ubTn=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=Ms8resgCPkEJAKzUOyPcWJgYYRczE95MqX3iGieJ95vgB9ZMBJezctNlhwcvPtaWKbiO0if6TRaf2r+41dKT8jtNVdQswvsoeLqXLbTx7vtZ5rZSz9HVTMI04ACWPLS6VnrysLa2nbKkJWnI3j+mUY1gdGvskyBGFZP5Wz9RVaZztDYXmzW/SiEkp6ihVje0Bh1Sev8fohKfgCx5AjVi6wTLmgBf2jg12pInK9wwh4pMlaTjwTBrBVPey7KIjMvWS2zO24Jh4D2TH8Zk9wCM5TYfvDgnThe3hELOwmV6UuZXeQE3Oz4GA8wuVFzARfy7r5yp1rHfamud7sAReaRcWw==
X-YMail-OSG: HdEK4ZAVM1ln2Jtv.30Oh1x.26d2fYue8_u7ndxGcM7tl59bdav.BYPY7wEo8Hk
 zybNsEaYnfnp9GHCDn6qQ3QlzxQhFUV1id_8kDDkqQU8Bwj6ST3adsXQvaO5DxltfgITZVDh8Qic
 __PeMrF0aaYfzly7r3Tz29aMSBqwarNoauZS_98jE49r6a1nWcR4mp5P_v9Mp5.UtClaNkTQZJXt
 py_QfMTmkAowXq2ZPN7U4W7w3PSM2x3YSBsZcCySOm3UfR8z3tO9.Suq1dJfEmIm6u9WfkEkk6DW
 LxCcf8a8XcgsaUj4z2nMG4UqV0biTdouNjswnBJBp0kf9plUayr07jkUP_PsFecPlJ9r519hWhRe
 hr13gHuH7lin9RCFNN9Ldpkxk7GI8LK26ldSeJuudUBRU9znYC5iweIv_NaA8GLuNthU2gLPOavY
 uZE0eCdbCW_yxFuPtDiHPCVgS3TUAKuzHnk_KTrQVqrCIHTOP1DGvAt_DYi5GEmgE857ITUhdeIY
 EHB6_u0.7vrO5vzlbAYZ1HEouvhny2.qugdiu9p_ElRPcd0ZcjG0lAQwph4HmsBgBfeEda7SAnhn
 oWx2evzAacpHpyi_eFOgb59ArvomeeId0_eo9OfwvbXHDGTj21qyo.9v0Tk4LLGoE26V7xBlRZBA
 wrwTHObIJk9upzeNulzj_d9gIet8cBNmBZ1EFEWCEsUgdDzhOio7swtThU.vrj5RUldwtpXeQFOZ
 6P3z0ZGbsGLB3TIWocbnWl84jNbdBfWKUFOfOKthPIGTL6ebd9CPf7giBGuFdzk7Rerg620YEKkM
 WHmKkMrXN2kh.gF3EJ8Hn6mA7rejzWnWTUg4C5VlZLm05hdmXofYAcZmPM79RgnvD2rdOHtvHT7y
 H7URWMp6uuHNZxSLZMKvkVogbnkcvNjulUYl7NJwYbOGjVRRJtyRP5mx1MeOCfTHxdWLn8xTZNDZ
 Eo4GsJFY3gEjxLDD7Z1mghFt86risCayN6v7jzT.3r4PGbp2IYTImmZI3jZPiyzC9yQZu7zu_WzG
 aYe2iYQvHnKOw7pksz7YgBxSnxSsHJSayR9PjQ_Sljo9zB5igWyHNb.p6oqY_fFURsLqHMmyevf7
 y0qshpfkbyqX64MyUrGlO12Ym_aoLi.keWpLnXuIVgwxrF.VkHYw4bupntLEgJjqolpVuFAIZPu7
 KXn6VZg_cQ0ZYnxcJnN0Ww9NgRPhA5jo84QaOO5jPCTinkNayGoXx7BwbprTD6bJqtYZq9.EVoBg
 fOH0x0TMgQVJxL6FOLy1FqQS5EZp1d6_xwvfreXouFmfuKPBvZ3DHS92Q5b.FC8grg4CTDS5CyKe
 1NiUBlMFsefuav1MEs22iZx4YR0o7pcjPBH.loBK9X6pfrDIgS_wDegmc.1_rNJu8Q8K6yeikKNt
 R8stB.4P4rK55HqoqGnhamphoj8AOn.XNp0.4UySsnMnFHouhwlh6bxKY2jreCfJXcwQGTW0oh.Z
 uq_ubjzzaoRBTWJZTquGKwqYTLQUMNrTsXnwWXbzqPdplLh7jXcmRFQXCM59DKLQysvtuX66oKGs
 pLb_lQAwpz_dJ09LOtAd2Pkzj.G3vBSTkvQKn.wKax9cKYsbwRWsAcib6F8InH9fS48_UEdPHxmT
 joyqRON6oVT02AbOgv2JbqxzRPabzdr1GcGHrj3GB0kCz8Eo_zY7UfFJaA7brgL9wBoUBk4vmO_6
 IpmbIN1joxm7WdAxw0otE30T.gMk3Uc6FCJFLKdQbq7S27fVac51vKS9nxSedBrZAFbp3jCJlQf_
 5PfPTQKtQ463uCi9G4kDw2tl4qieFiMzw2WmJvaFPYRvwTF3sW5lbcfzBKU5V7TUdAdDz.GTNwgu
 zCj8_cWIHNIbGw3F5RqzDzn6vSBvIkeLiXg4vVOMZ11ScjADqWytqHuqeEJsUAi8wt4C_9WxJOrF
 BjOosJOL.ijlSPuXAI31j2PtpFBJfm5NHquuNmlu_aw1L2XrVh_vv4j8iCyCqzkYmnL4XZYIr.ZS
 ftF3KMAsLCwOxEWhUCKZ6g6iGRIG1JRyG0An4L8RpigzzGVWF9uH9c2n2P9r1Owf8Y9ADkR7PO0j
 MiZt7gejBffvSyqN4c1Z2rwSwHEGqfsSTT2TbY7w9yS8S4BCJ6BM5VpgaH9eSlU7gCQ8nKPrTZPI
 fVmfV2Ih1UfSeB6eFGkd8a47x7Djiqmr2kNWIijc1A3XPCKzJUB6ChZEurHcgqYwIn5gaNS77osg
 5.pmtfZbax6K7RVHcceqMd4JM.dIkbhTD._2F68RePm5uQA3iekH7XHpdG2GKzA0zlEYcR.Wvbd2
 UiT11g4R14yEdbK7tum2YVBDMPbkF
X-Sonic-MF: <pjp@fedoraproject.org>
X-Sonic-ID: 312ef511-2183-4922-84fb-568bd66b3618
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.sg3.yahoo.com with HTTP; Tue, 23 Apr 2024 06:41:37 +0000
Date: Tue, 23 Apr 2024 06:16:07 +0000 (UTC)
From: Prasad Pandit <pjp@fedoraproject.org>
Reply-To: Prasad Pandit <pj.pandit@yahoo.in>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Message-ID: <1927988181.1604457.1713852967808@mail.yahoo.com>
In-Reply-To: <CAK7LNAReoYHT0-SUzFT11y=pN6GTLSgu0+7Su+2Tthkz5VFymw@mail.gmail.com>
References: <20240407072933.3562124-1-ppandit@redhat.com> <CAK7LNASZR=n+T=9Lo-5=Nw9WTwY9ywdTNvAUdt8xDXxsnNu3Tg@mail.gmail.com> <668901914.114470.1713335369416@mail.yahoo.com> <CAK7LNAReoYHT0-SUzFT11y=pN6GTLSgu0+7Su+2Tthkz5VFymw@mail.gmail.com>
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

Hi,

On Saturday, 20 April, 2024 at 12:54:59 pm IST, Masahiro Yamada wrote:=C2=
=A0
>>Because even config entries ending with an 'EOF' are not flagged as an er=
ror.
>Why should it be flagged as an error?

* Kconfig file defines records of config entries, wherein each line starts =
with a keyword. Line there implies an EOL at the end. So when a config entr=
y does not end with an EOL, then it is inconsistent with other config recor=
ds, which then requires special handling while parsing. Ex.

=C2=A0 =C2=A0config OPTION-A
=C2=A0 =C2=A0 =C2=A0 bool
=C2=A0 =C2=A0 =C2=A0 default 1

=C2=A0 =C2=A0config OPTION-B
=C2=A0 =C2=A0 =C2=A0 stirng
=C2=A0 =C2=A0 =C2=A0 default "Value-B"

=C2=A0 =C2=A0....

=C2=A0 =C2=A0config OPTION-N
=C2=A0 =C2=A0 =C2=A0 int<EOF>

If the last entry was like int<EOL><EOF>, that makes them entries consisten=
t and easier to parse. I don't see much value in allowing such inconsistenc=
y.


>Kconfig does not require a new line at the end of file.
>Same for other languages such as C, Python, etc.

* It's not about EOL at the end of file, but EOL at the end of a config ent=
ry/record.

* C, Python all languages define statements to have fixed format ex. in C s=
tatement must end with a semi-colon (;), a function definition has to have =
both opening ({) and closing braces (}). Python requires that a conditional=
 statement must end with a colon (:) character, Python also requires that i=
ndentations are consistent.

=C2=A0 =C2=A0 $ python t.py=C2=A0
=C2=A0 =C2=A0 File "/tmp/t.py", line 3
=C2=A0 =C2=A0 =C2=A0 if (x =3D=3D 10)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^
=C2=A0 =C2=A0 SyntaxError: expected ':'

And any such digressions are flagged as an error. IMHO, config entry record=
s should have consistent format/syntax.


Thank you.
---
=C2=A0 -Prasad

