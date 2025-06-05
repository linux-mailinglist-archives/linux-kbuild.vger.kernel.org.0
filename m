Return-Path: <linux-kbuild+bounces-7371-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE149ACF80C
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jun 2025 21:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98C2C168FFD
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jun 2025 19:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A444B1E5B64;
	Thu,  5 Jun 2025 19:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlGIfM6t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA3A7260C
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Jun 2025 19:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749152041; cv=none; b=gspsmJ3ibJnutCFvYQOOCSptpyfH+N319Fa9VurCr9k9b2fbblFd82CFsoprwOaM7bzol9kI61FYCkwMUaLtBVyCuiAbH5iXCBBUxHjKa56dFSqZyZhqVrHz3n5C+GPT2pNJ+++ejZu3kZbgOZWWVeXRm5VG37n++zi60VDq4VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749152041; c=relaxed/simple;
	bh=6vkDFUgfk/KPimA2hfG+QKdDHl3i5E6I8rpBtHwZELo=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=F0x/+2PU4W8iqlK2l0WFT9yuXotc5xPh1iz8cSKlMSpIT75lZsa7VAMlFRMVApGqztrPEQhe/AkwYgxqKfclUsJKN4sOFwdbWDxOt6z807zVDjLbf3cba55PHOlEHrBQEAjjBtLORGG5PDrCTaVPWppWg9aOw4DOEGXsxtajOhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlGIfM6t; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-606ddbda275so2466935a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Jun 2025 12:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749152038; x=1749756838; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zyz4cV98RR31UL6oh+GDNZpjNU+s98ZqFYrG4i1eefA=;
        b=KlGIfM6t35KEzM8RFThSCOQqSM9Jx/umiuq4ZmXF43OjOx6YKZZ58uIu5VyQqAjGHX
         gfHZSvKpm2YCWEr9arQ5+3zBgpSW9uQBh2TvLMYOUolL0aTlQlz3jPbI/0HwqAVqRQDG
         QUlLem0tWadlaL9dESNXlYv3Su14BTAMZ2h/Oko9rkCsvFjX5tWQAw3Pm0/ZkUHPbyXK
         CZvm52yZic91sPVNaGHGC33rmMsJUAH/Iymokdvmel+fD0ipgzNCPe/7Q7ar3yscfJRa
         Bun5y8WR0YaLxjgUgty/4SYUqkFtwXFpGT1LZLhlEH33m3E2v9F9hjPjKe5c6Knv+uhP
         +Y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749152038; x=1749756838;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zyz4cV98RR31UL6oh+GDNZpjNU+s98ZqFYrG4i1eefA=;
        b=Ye/Z0ne1ZMsurc45aJDf+rVGH3EyN9LNSK6DhJvKpl9qT44uCqcF392JywG9kk02uI
         e36vX9+UFm9CsTNR6DIFCnpTsIEKGhy390EfFWxOnzKX2oLadadrfvS8FOQG5a30sO58
         NUQz3Zp2IGMfw9cpMpC7WWJKE/A0eQIgDbHUIElsDHIScyeGiGQ66pzBMN2VLW0ULPQH
         Shi+73DUG7+3pty1gV7BDjCEv3SKNbRm0cbfHUtqwYU5X2bWNxht0pmMauuRAAFXKgiJ
         Aq0xgAvhwlcTpsq/ryz2XM1nfIMhS6/KnPJvbKnuWOJE3T9qnb+fzMPA8nCRtoqpZ4P/
         qr4w==
X-Forwarded-Encrypted: i=1; AJvYcCWKj6uX2qtsOQApgH6Q2zNeq5T/rOP0LKWiX28nU8HMGitGBrCE38EcKNsllw6yQcWOUIG83PT27xWnsRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO9AkZ1n0WkwrE1LOj0/JdQ5ltecpi5vFxhkyj5QoGVXwSrFXt
	hOmj6IYWLoUPfBGyebgoQKgvSLzHXGLUheTKIkpsKNgHXsrODk/mKB/S
X-Gm-Gg: ASbGnct0fwaVluQJ+/8tuI4SUfa9bD6DF7JNzZx3NFr+/gKdMZp4iOtgJQLfCQ/8rcO
	ki9PCF03J6UEDw7bxbe8FWPLnQwo/ntIikYESD4hPTl9U3fkFFjibalyyyu/iNI/8xrjbzK2qYP
	9bWlMv0egbVQRfWzZApUFeLMovAE60sXxniFe4rsmyrXtJv32txRtlynRdYzKYxyvlLyDavO39q
	yvgmyb8mSqLt7slNrFFfIlr+Ohf2mcbSPEqvhHX90GhRllE+QNzzlenC8Q4vncClvR1tabO4r4K
	n/nLsrgXSDtB9NfJrHX1SZJl772WoV8G1fXthI/JAZb7b9GWrKxebAuOrGAA94XJZXutMifX6T3
	KkTAxLNnuZdbjc6kg47CK
X-Google-Smtp-Source: AGHT+IFNWBuQsperQ2ODElaEWr0dGC1JUlAuCSX54alJrr+gWVPfeIjiQPB3QMv0n6rI/7+XXI8aag==
X-Received: by 2002:a05:6402:5190:b0:5f0:48df:25ae with SMTP id 4fb4d7f45d1cf-607734188aemr359229a12.2.1749152035975;
        Thu, 05 Jun 2025 12:33:55 -0700 (PDT)
Received: from [192.168.0.3] (mob-5-90-28-160.net.vodafone.it. [5.90.28.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783decafsm34027a12.65.2025.06.05.12.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 12:33:53 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------NgiBNKiM2NrPPdvJ6FztB5rR"
Message-ID: <05174d44-ce14-4577-bece-723661100810@gmail.com>
Date: Thu, 5 Jun 2025 21:33:51 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Kconfig: Added compare capabilities for mconf Ver. 2
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org
References: <20250604183539.425053-1-martellif67@gmail.com>
 <CANiq72m48ixGdMSpr7bWVBBn3ckHmj4pfy9GU0ndVefYXQEzSA@mail.gmail.com>
Content-Language: en-US
From: Franco Martelli <martellif67@gmail.com>
Autocrypt: addr=martellif67@gmail.com; keydata=
 xjMEXwx9ehYJKwYBBAHaRw8BAQdA8CkGKYFI/MK9U3RPhzE5H/ul7B6bHu/4BIhTf6LLO47N
 J0ZyYW5jbyBNYXJ0ZWxsaSA8bWFydGVsbGlmNjdAZ21haWwuY29tPsKWBBMWCAA+FiEET9sW
 9yyU4uM6QbloXEn0O0LcklAFAl8MfXoCGwMFCQlmAYAFCwkIBwIGFQoJCAsCBBYCAwECHgEC
 F4AACgkQXEn0O0LcklBgAwEAhdX5TbxGOmMhlJUi9AkDACN2ZemI8Tz2jSZPDlOQoE0A/3Tq
 SPaEkb6kvK4xw626+AUDrfIzwzBscgpkDo4zCW0DzjgEXwx9ehIKKwYBBAGXVQEFAQEHQNP5
 V2q0H0oiJu89h1SSPgQDtkixXvUvRf1rNLLIcNpPAwEIB8J+BBgWCAAmFiEET9sW9yyU4uM6
 QbloXEn0O0LcklAFAl8MfXoCGwwFCQlmAYAACgkQXEn0O0LcklCMtgEAuCcSolf8LBIB4WTI
 4YGKiN7qBXfW0QTbPO+bPXQLxfEBAJuoVm3BlyMHoNG6UEZ2TcqfV8k6oRqwr/c0IXwJqEkK
In-Reply-To: <CANiq72m48ixGdMSpr7bWVBBn3ckHmj4pfy9GU0ndVefYXQEzSA@mail.gmail.com>

This is a multi-part message in MIME format.
--------------NgiBNKiM2NrPPdvJ6FztB5rR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/06/25 at 17:05, Miguel Ojeda wrote:
> On Wed, Jun 4, 2025 at 8:37 PM Franco Martelli <martellif67@gmail.com> wrote:
>>
>> Signed-off-by: Franco Martelli <martellif67@gmail.com>
> 
> The commit message is empty -- please see how patches are normally
> structured, for instance by looking at the Git log or, even better, at
> lore.kernel.org.

The commit message is the subject of the email, I used git to send the 
email, this is the command:

$ git send-email --annotate -v2 HEAD^ --to masahiroy@kernel.org --cc 
linux-kbuild@vger.kernel.org

> 
> For instance, what you wrote in "Changelog" is what would go in the
> commit message (typically "changelog" refers to the changes between
> versions of a given patch series).
> 
> In addition, we normally don't describe changes file by file. Instead
> we try to describe changes as logical units. This may also suggest
> possible ways of splitting the patch into smaller pieces.

This is a pain for me, English isn't my native language so I'm not 
fluent with it :( sure that the patch can't be accepted?

> 
> Finally, I would suggest passing the `--base` flag to `git
> format-patch` so that it is clear where this applies (i.e. I am not
> sure why the text mentions it was originally done for 6.1 --
> development should be done in mainline, and re-tested etc. there).

I did it, before to send the email with "git" I gave this command:

$ git format-patch --base HEAD^

As a test now I send as attachment the file patch generated with the 
command:

$ git format-patch --cover-letter --base HEAD^ -o /media/data/

Does the attachment file satisfy your requirement?

> 
> (This is not a review on the contents or the idea/proposal itself, but
> I hope this helps you.)

Thank you very much for your feedback (and patience) :)

-- 
Franco Martelli
--------------NgiBNKiM2NrPPdvJ6FztB5rR
Content-Type: application/x-xz;
 name="0001-Kconfig-Added-compare-capabilities-for-mconf-Ver.-2.patch.xz"
Content-Disposition: attachment;
 filename*0="0001-Kconfig-Added-compare-capabilities-for-mconf-Ver.-2.pat";
 filename*1="ch.xz"
Content-Transfer-Encoding: base64

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

--------------NgiBNKiM2NrPPdvJ6FztB5rR--

