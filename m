Return-Path: <linux-kbuild+bounces-11625-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABUvAswUq2lzZwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11625-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 18:54:20 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 756F0226790
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 18:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FF17302E7CB
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2026 17:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A24135E94A;
	Fri,  6 Mar 2026 17:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="tmQTUOBp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AB227A904;
	Fri,  6 Mar 2026 17:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772819655; cv=none; b=CxCTZheN0pz8xokyDAcwyXAaWSPgIuWxv2ucrBXW8t9YRfZTp/6Lzc5ukN5jPyQ6mCeRqIKyNhd5ADI+mrNHm9HHDkNF3RTbadaNZPWGAruQioCnhYBt4UZptNSz8JiS+XCdg7ksDBuloo7HxOqVwuegzjJ/TReU/5zwsJrowmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772819655; c=relaxed/simple;
	bh=2kDrZa72RrA/SkOQAFZo1s8a3LVxzlHcdjw4x89aQr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2H54LMm+/nCk2ldA6nxG0T5RQ6GpFRxUGR2OimyLrMaDXtVPZR2LI77GGhg1AUQA7bGPSSxUbHwGIdy5NV+VGYP6WOgpDFj2R0nvrDjVJ3cDJ3zwffoKjtoENTh+4klOaOSrOKLB7pa4J2VV7LQ64tUuo0KT/lYfQViP0tjE5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=tmQTUOBp; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772819622; x=1773424422; i=deller@gmx.de;
	bh=mmKjsSlKDsRJWhwi9pX21eWfYY2e4R6tRA5wPvNuGeY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tmQTUOBpdXTJhu66PaGrEzVb81TuP9i5cjmgw4hd1KZrVEuiyS/SY7feF9pfio1B
	 U1BqVcXIyHRy7KjJvssNdunJWRJK24b01YKfrOzgT2iSDsBvnWyu6TQxNagAVjGXw
	 dpIW97XzJrYdT5rjTPJSmqG8B2V0kOcRBtsVxBWvbxVv8+8foZ/16vrjS2IGEDtnM
	 cSmjS6wAxBsaGKL9Z0ULr2nmvHgbJzRl1qD5D8plllm6t6MAWkQfAbv2SP6ph/rTq
	 uDwEdBX7epC2X0d0vwEe5leyywhI/ooEId6ckey5oHjuPFtVvsBfJTbr773TWV1h/
	 XugIwuR0KpTW6y2Jrw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFbW0-1vsXkm2Ejm-004Q43; Fri, 06
 Mar 2026 18:53:42 +0100
Message-ID: <209355d4-2bc7-4656-8baa-a62fc16a8418@gmx.de>
Date: Fri, 6 Mar 2026 18:53:36 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kallsyms: embed source file:line info in kernel stack
 traces
To: Randy Dunlap <rdunlap@infradead.org>, Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Richard Weinberger <richard@nod.at>, Juergen Gross <jgross@suse.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, Vlastimil Babka
 <vbabka@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260303182103.3523438-1-sashal@kernel.org>
 <20260303182103.3523438-2-sashal@kernel.org>
 <258d7167-2e82-4402-9545-108c501ae69e@gmx.de> <aajoETEtX9r2XzT7@laps>
 <eab67de3-74af-45d9-bf67-1bf2c10aec37@gmx.de>
 <14977e29-cd76-424c-89c3-9f8c73186e27@infradead.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <14977e29-cd76-424c-89c3-9f8c73186e27@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:400v6vfu8r7n0YE7Mju3aQ/vwMnRu+W6aWVNodJhU4EZg9b04tH
 vcfBQJhOtsMHtk15qCpTUGVCiqdHMCTTNVU9iAKuGwjMX2MUVwsxyAAB315AtnuOhv4i5Lm
 EFeEh3/M7sIG3ZiKxTM5QQGjPLU/h7nuRtmJXVf00ml3Y/+VYeU5lPex+zu3PxZSlJK6pfY
 LJ3itVJATZDd6e2PZYwpQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1KYvENPC7Ts=;JnP+HoAS5BDNJBXuSVZjtSiy/4n
 t+EvQU6nMD4dLyzqvUVJxx2ByNfY1KPzOIiAMxE04NH9H2fru7J4uskZbQ+5e0p7+knG73qUd
 VLaF+Z5oHyI60F/WcYTd0kFGdpSPmI+HPbtEGatbojBda531+QIcXvFwJ/4Pv6IpVduIHgMRS
 VWfvmYiheiOhkFLsCdAkuFO7qWLEgQT9bvD1WXTX1beIlPv26RQt/7B+A6QYE3/cu/FfehBPe
 kn1hooIiTVCHg6JKfTqkSrXKFA4nwetRS+gTxaDSvRfooy1f6A7QldPVf2bFbRocXHe0MU/Oh
 XYievxK1sw6y9hDDWWrztJVByhY58Nt50VIHq4/UYo3g+BFWL2F/dv+4ALmeeraD9Y/NDcgbJ
 AFyw2bteRE18RbGugPU+9QdnFOuYlCmi6deZK473HZITGH5YmKUMOEscyIOR3NIC5Dtu4KLwf
 o1gHjPZa9h5du2lc2CnE+6gCeTpNND8jOkzEgtO5YQlT5jsKd3z3rio9Gy59flCcyn5Yo/gSY
 gL1XzQGwzamvShQZ4yuYN4mI1pGequLq/VUNOmaChbv/CO2B619pY65b6yDtszCkz12pXKmPZ
 1/OpjUR41KhXjGiClfBQEqx7R6HkKu7lFGPhKjQyvD5zpPnEeh9nUv+GZ2sGGWWeI+KxpeomE
 0GpCFrdsdrlxQkKZDhK+wOQbnc4RBtl3WxZlt7sTTuZnRygmnwlDW5kADkNCfAQWqxhq224SG
 z9/JwqpEqjjlKmqqSn25ffyGqH64fIFMcT1lE7Bl0K43O7J6Bttujrln//1GpGjN/cdcVE/+R
 4OEmAjVpUyd9g2pOaHDKQQSJ28Cu+buC0XBdQohyzvScswA7AeWBpkFlkgLBQlVV473CO8ubG
 OTEaxVdn9oEQx/zqt/8JYPF36DiGScV+jcM/QAmVc9hom9dJXl3VB0bxvjdJ07G9/2Mp6fCx+
 AG6NrP9FejkA6ppoFMARvqO31/kzT9rrlP08a43S53+fjdHF7368Y2kuruXUZ0VInMn/RP866
 rHkl7y4j61/mwd9zeLQHVYIq6eJgx1giuDelcPS2oDrD2rJY+SNj14alWnDWaCifvad0/vfa2
 XFms0juTqEAUlRiD7BSt63jApiGPlAHkdQdi9lPOznAWSF/Y1+KDQ1ZM2IDP9XMgXoISbCaE4
 zJDlXNrQw/gBFTdh1Jjsnkshcyi7rKOGqqvjdB1Z+K2KcYr9YmMFcFo5vWd/N2nqxIgGNkQQq
 p3yvErMPP8a4pK13ZGDXHyd1E+Nrm8ddpsiomQKUsZBXAdrd6J1DTfdW1+Vczn1Gx7W64LUP5
 BzGshh1AArWveJVyDgkq2OZR2CdFBQfBU99J8zrAeUgzn51g0vP75FCXX5qfFiBnEGzihUHFY
 WIjX1pyS0S0/kQkd0eH7k2De/Y4K4KHye9eihS7V7owNRgbx8+GDLmOe9F9HE/PuzU3w16jMF
 JRR9e36NKuqU47CxVu2DCIQDLBPAHR3HMuHE2z9otW0TN1agPwh3fiTt4o9yxM+Fg2KW7BMuh
 87Cm9b4HroI2LIrGzklf/oDWjJvu8RWeZ5/x5rhu6VoswENvMGj/bWp+CsjLIPbM8bHVfABg2
 TFGOLHn/GBEa0lyyhI56gBlbFDNswXSatnEHND/CxP9eC6chKFqvNrwa7lbfX091efOYThhkG
 vpFWJ/d0jNE+PiixPvLeIdokksrleljX7rBYPqK0qlwHl3cOcjkg1fKh4QI5RZN1K0zoCIQLh
 Id3NcQOm7wyDcTiT4WKL+BbCblZaVYoaUuvdUcfCKh5Z6iy28pcZxKRiev/AEhWUBY18juPzl
 3rbtQMrJwpnRth8hbSld3ftlndI5daH0VDA3fNwtZU/7ZPspAH6lv5tCmEwRNOmjt+gUFdRvE
 Ibwk7W6sb/UUmfNQZdPvpx6s+aMJJ7PNmcwFCu62xJfAsj3XigiKxlAZHK3+KkZaxYallf+Te
 mogdXcQ3Yk3Fuf4MFM2Ik5WE3RaZlWgfn3I3xvFtj8IoClRmb4XEpo3i8tmtWy5h2ljpnn97J
 7x2stZ18fWSig0MX+X/rMtAKew2EEX/g26c1c38ihrj8DNMA9nc1ESCFCibkfgoXI9MKcfm1S
 kVHj84PECo9wcfg/h5yRW51YrSIpRFTwT0oGeQ78qQdPobagKcBXVE2N1388k1pE45g1PjNPo
 TOehD6ispkQ4qP+2/tsq/uSJX/DGSt4DK4JxnViPaXtbcfLWbs+WBBAj74KYOpAJhrEn+m4ri
 moZ/NJ9Fg2GUO2NEoA1IHdJQ30gPPET+gh/iErPmURH28dIc7ptyHGNkg9GmOzLeV3TFDtRLU
 eG8kcKoa248IpJb+1Z50CjldAFa0i1JIEVq1zf5hRsJLOugnnLXp6OGAvgTz6wez2madcfNda
 +sWfVgglp5bJwGG2HvZ7jCRZ5Exo0FLgJEt5K+YvTw/QgBiIQM8E4XWJo2TK4mZN5rr2pTR/s
 zp+Ue7wmia3420aIhbAiCJpIhigBWcDVJ00qGuVIHnO3KYKSNvwODwotxBleNpCUOg2tsQ2Z/
 1CO/CTUhehq0m2KWYzW2UZstEWZxzJa2gHLx5ad1e4WwTObyxbHI/qbrjlvWiyfVPdPs9v7xv
 XqCaNdSZsmU+5MyDGS6piJ5tDt96Hjw0er8zhXKFNuIWUUyPZ1fPjjZ4b+I1UyTssolITE6m6
 9TIwMzt6AoctFaulQWO3o9OPfq6CaPCfjRGy1X5woyOWi0QYlm855dLvJceo9TP8ry1pNiAcm
 X99qj4wvsIAXt/bj7mJZQoEaarvmci5WkeTsAtbk+yf/0uomDPe1vVTKe2KFya04708ss1/8a
 YfUzDewcHuNfjJnVSh+9Eltyh6MxjpItha/bSMp5ITmmNNzEmqLRQnfwAxRovY7hR1XBHLH93
 BCWYKI1681+4WNVusLA9bWl33Up0JTgr1Y+CTns02mHPsuyYQUkyfu2LQbWflK6by4YuTPDjY
 DW3yWxuxr5OGfs9yR5Fn/SgNldccnSiHv9R0TPMU3FETanyLqn32QOfA3GcLiVE8/4LvDxLKe
 0CrFOTMmjLPtjEuKH43RlhfLxTo0mNKHuECxHMBLFCpJnmHkfsHxZWLo8jHzxxfZOlEe7YXbP
 twiUzxe6ouYB8HcxS3oSiLYwyTKLzGtQjP/Jo5OQOC1JZm7aAZnivAcYxvztDDpa2nm4ge5tk
 UtS1Qa5hUhSt1VEiV4laEnCEePeamIzAryMBYwgCLNTetMW8A2wR0Y+dSXzHDNQFQrvctpcP6
 3kamgsVYjH2cTfuki5kSYhrT0/IRSNv6j2UyYleADrUjwUdbGwbmNcyrVOLrUjghIK2pvp8si
 LwbzkRHWFAWNLz3DV+/rDPBeUV0SpM5c2bRjZq459nioXmlX8wj0N9JmhDfNLB5BrOSqupaXc
 hkGOi3DtwZaLdaxcMsCdfvcY+90D8aUuFGuY2LUUbxVterxAvGriofMGgQMAO8yVmq9/z7W4q
 KX2+Go+jKl+ve1AOB1GhPbISgHkrh2nlN+TRHUjUW1BpA2j2KRIJks8SOM3ho/4g2rU5ix07D
 +vMA5xnq9qR/Uzpo6Gjrt2epFB/D+ZjgBXL/2xNmqao6VUnikhO6YgHqv4rzGC3CUM7oL4Xc9
 yXf0tIJj/sckLxi28g3ntSzyOUjf8VK7uHVIeR6WQGFNHnV3YoFeoK5RiRnJY9fIJM+tGHW/B
 PfEnc9FbZg6D+LGA88E+6PMv099hN3G4s6hlsEFpO/1vcK+dDCXQ1Xx1tn0S/DPwPgXKMSvbh
 RDCJ9o9oVNsf+H9O70Pc4rQjKFQk6/qRjY70lP5QsTxwwnGf0SEwCGgcU92Ej0s5DQ8o8cmgh
 pVWmSJZkY4sJFU0DfY1LKVIQjPbvwIzS40uGzpvC5hA2JOGrPi1t5C6Z+PhN52DlkoduGz7UZ
 s/epIfZ+ss7j2KjUhY/oTrdxJLdafDBvY2+w+elDGpr40BnPkot2el8nd9VMptSHaS3URnS5V
 HN2/7IfbB6MupsRGc1SqvDl1heaaUtLb+mnGegkdKdQO/lUMsPhn4cSMQWa7o1Kb+358/1U5+
 nXBN8qUnIm2kBze8DTtjBvgJ0bC4gGNUy0bS3vU4s+oHFJ2NUC1a03Zt/rpnuGrDO5BHAZqqO
 1pX0/3uYxbqs1MxGRqA1LK/lKvVYoQ5Bo62XgMKuZa9uX5aEEMzBhNjcLx5WhnkMc+gqGq1B8
 RL00aOu+ENOM1ebo2CwgMFq77190kWxJccxXqUC64o7trNrxpQmMQ/g7+TFjN4JM2Z/d5Kxjo
 GJvLRDuPyeH+tCW9nJ0hgPc4wi+OtKzcDCLkzMWTReeCtS7Ui7G7SskG6dmNN8jtIwOoVPN3x
 p6lMvbowD61D7R9utmf6n1HR5qtvM3KnWLf5/f4DEXuRlLq/8/TOmXguKVGCq5Z4RgLax+RoM
 ylDC6peemy6+ZNzfFawC0ekaeqlXVRxj4WguAySEun9slWEZa7D0MujLiYBxHof1Vy4EUjhAy
 bvUWUunBZmP3Qtn+TLywV8ItqwqUN9l3Rpzy9BVWkdC4sDUu3FKyDqSh08WWWr4gWe69HkVIR
 GT6RIvJ3e9XIb38bpCbe++U8BdlNkEPvCebmb5Tb48hwsjkrnt0vvk0I1gfNqShbhg4yvoS/D
 ZmbnECQv9MU4dJmefWkY6Q6S9gHXgrmnTrL51jtaWqHB/h1dQ8G3ofjQCk2B/1RWPvrBTU8N8
 nD/lNSBOETqhNYzz5hqPxfYEYsKI6ZfyrL1CTjJtHIdPAm6LZ661tYEzeNzreRHNj7RA1NSaJ
 qUBluSOXQiOxSltWDqDbz2Qmx6MjKszpCmQOVcOKbl/6VPETGOSODpSFshO4IWj+Vf5+oStcV
 GdYcEk8h9JsKyOyS14CEkyhuaafv3EAuI02n05Qs8sPEj+J2UCG2tn31gmoiT7nyRL/ANpmgb
 EeAKybY11Vvd/OOsHzrOnZonWrH0wYA57wfBSrc+W/HnDqvCGmiqDNE90PXKbm57ADK2M9OvA
 ygwA6WNty0Tsi6MrcdlkKjDA0/4JIfggTeSRpJ8WVKC9N8ZmTF4hqx++knTnlJgvAgmccNAMC
 0L+z9u2flf+b1BHDzWpb8RM2vwbpKy2xniILq+ksQgUAsEEC6IbLgcyMHtl3GMHdWR9CyVEj3
 xtJ766eXt/D5RZ8FF3VY8Wyp08YyYtGOtTJvbTnhpjQwGH+yy9m41uGQ9mTmvm5bt+MQhZnGd
 ykbnAjgnyK5Bs8ytbnNlTg6QJuM0n
X-Rspamd-Queue-Id: 756F0226790
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11625-lists,linux-kbuild=lfdr.de];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.795];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,debian:email,localhost:email,gmx.de:dkim,gmx.de:mid]
X-Rspamd-Action: no action

On 3/6/26 06:31, Randy Dunlap wrote:
> On 3/5/26 2:26 PM, Helge Deller wrote:
>> On 3/5/26 03:18, Sasha Levin wrote:
>>> On Wed, Mar 04, 2026 at 09:17:37PM +0100, Helge Deller wrote:
>>>> On 3/3/26 19:21, Sasha Levin wrote:
>>>>> Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
>>>>> lookup table in the kernel image so stack traces directly print sour=
ce
>>>>> file and line number information:
>>>>>
>>>>>  =C2=A0 root@localhost:~# echo c > /proc/sysrq-trigger
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.201987] sysrq: Trigger a crash
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.202831] Kernel panic - not syncing: sysrq t=
riggered crash
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.206218] Call Trace:
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.206501]=C2=A0 <TASK>
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.206749]=C2=A0 dump_stack_lvl+0x5d/0x80 (lib=
/dump_stack.c:94)
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.207403]=C2=A0 vpanic+0x36e/0x620 (kernel/pa=
nic.c:650)
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.208565]=C2=A0 ? __lock_acquire+0x465/0x2240=
 (kernel/locking/lockdep.c:4674)
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.209324]=C2=A0 panic+0xc9/0xd0 (kernel/panic=
.c:787)
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.211873]=C2=A0 ? find_held_lock+0x2b/0x80 (k=
ernel/locking/lockdep.c:5350)
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.212597]=C2=A0 ? lock_release+0xd3/0x300 (ke=
rnel/locking/lockdep.c:5535)
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.213312]=C2=A0 sysrq_handle_crash+0x1a/0x20 =
(drivers/tty/sysrq.c:154)
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.214005]=C2=A0 __handle_sysrq.cold+0x66/0x25=
6 (drivers/tty/sysrq.c:611)
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.214712]=C2=A0 write_sysrq_trigger+0x65/0x80=
 (drivers/tty/sysrq.c:1221)
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.215424]=C2=A0 proc_reg_write+0x1bd/0x3c0 (f=
s/proc/inode.c:330)
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.216061]=C2=A0 vfs_write+0x1c6/0xff0 (fs/rea=
d_write.c:686)
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.218848]=C2=A0 ksys_write+0xfa/0x200 (fs/rea=
d_write.c:740)
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.222394]=C2=A0 do_syscall_64+0xf3/0x690 (arc=
h/x86/entry/syscall_64.c:63)
>>>>>  =C2=A0 [=C2=A0=C2=A0 11.223942]=C2=A0 entry_SYSCALL_64_after_hwfram=
e+0x77/0x7f (arch/x86/entry/entry_64.S:121)
>>>>
>>>> As mentioned in the other series, I really like this patch series.
>>>>
>>>> I tested this series again on the parisc architecture, and the relati=
ve
>>>> directories are now stripped with this version of your patch.
>>>> IIRC, the previous patch did show the subdirectory names.
>>>> [=C2=A0 132.840382] Backtrace:
>>>> [=C2=A0 132.840382]=C2=A0 [<104254d8>] show_stack+0x50/0x64 (traps.c:=
212)
>>>> [=C2=A0 132.840382]=C2=A0 [<1041c0c8>] dump_stack_lvl+0x6c/0xa0 (dump=
_stack.c:122)
>>>> [=C2=A0 132.840382]=C2=A0 [<1041c118>] dump_stack+0x1c/0x2c (dump_sta=
ck.c:130)
>>>> [=C2=A0 132.840382]=C2=A0 [<10402218>] vpanic+0x154/0x344 (panic.c:55=
0)
>>>> [=C2=A0 132.840382]=C2=A0 [<10402438>] panic+0x30/0x34 (panic.c:787)
>>>> [=C2=A0 132.840382]=C2=A0 [<10bebea8>] sysrq_handle_crash+0x30/0x34 (=
rcupdate.h:110)
>>>> [=C2=A0 132.840382]=C2=A0 [<10bec720>] __handle_sysrq+0xc0/0x1e4 (pre=
empt.h:14)
>>>
>>> Ugh... Can you confirm that you've build this kernel with O=3D?
>>
>> Yes. Both -Os and -O2 do not show the relative path.
>=20
> Helge,
> I'm fairly sure that Sasha meant with O=3Dbuild_dir_name,
> not -O for optimization levels.

Ah, ok.
Anyway, I checked again.
I did *not* used a "O=3D..." parameter in either case.
I recompiled again with the RFC patch, and here the relative paths show up=
 again (even without O=3D):
 =20
  root@debian:~# echo c > /proc/sysrq-trigger
[  121.172011] sysrq: Trigger a crash
[  121.173986] Kernel panic - not syncing: sysrq triggered crash
[  121.176141] CPU: 1 UID: 0 PID: 382 Comm: bash Not tainted 7.0.0-rc2-32b=
it+ #2971 VOLUNTARY
[  121.177041] Hardware name: 9000/778/B160L
[  121.178092] Backtrace:
[  121.178533]  [<104254d8>] show_stack+0x50/0x64 (kernel/traps.c:212)
[  121.181408]  [<1041c0c8>] dump_stack_lvl+0x6c/0xa0 (lib/dump_stack.c:12=
2)
[  121.182145]  [<1041c118>] dump_stack+0x1c/0x2c (lib/dump_stack.c:130)
[  121.182779]  [<10402218>] vpanic+0x154/0x344 (kernel/panic.c:552)
[  121.182871]  [<10402438>] panic+0x30/0x34 (kernel/panic.c:787)
[  121.182871]  [<10beb5a0>] sysrq_handle_crash+0x30/0x34 (drivers/tty/sys=
rq.c:154)
[  121.182871]  [<10bebe18>] __handle_sysrq+0xc0/0x1e4 (arch/parisc/includ=
e/asm/current.h:13)
[  121.182871]  [<10bec7c0>] write_sysrq_trigger+0x8c/0xcc (drivers/tty/sy=
srq.c:1223)
[  121.182871]  [<106ba460>] proc_reg_write+0xd0/0x10c (fs/proc/inode.c:34=
3)
[  121.182871]  [<1060faf0>] vfs_write+0xb8/0x46c (fs/read_write.c:691)
[  121.182871]  [<1061005c>] ksys_write+0x78/0x118 (fs/read_write.c:741)
[  121.182871]  [<10610114>] sys_write+0x18/0x28 (fs/read_write.c:748)
[  121.182871]  [<10421334>] syscall_exit+0x0/0x10 (kernel/entry.S:1722)

Helge
 =20
>>> The RFC had a dirty dirty hack around how we turn these absolute paths=
 into
>>> relative ones, but I tried to re-do it so no one would yell at me :)
>>
>> Seems it is needed...

