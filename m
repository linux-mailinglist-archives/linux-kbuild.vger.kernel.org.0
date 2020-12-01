Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD452CA96D
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 18:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730711AbgLARUT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 12:20:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730652AbgLARUS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 12:20:18 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B05C0613D4
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Dec 2020 09:19:38 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id u2so1490528pls.10
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Dec 2020 09:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=IScs+zSLeddsan7ZzTy5DAkXqV1x07ZfawifY8VzDZo=;
        b=LFWaKX/D8QyAMKfSb6pdcZQbEAu7nsGyuj559M6PdskvRSjSiPkWLnJCzpr4qUguOQ
         V5bxhc8Pa4dBk71UHN7qmi7hJOkaJiX/RDOMtDXeSLR7nAl7E6xMGajCGPcS1AJwW8lE
         x2qE8KEnRaC4ZB8GowU77io/ryunXhNulSWWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=IScs+zSLeddsan7ZzTy5DAkXqV1x07ZfawifY8VzDZo=;
        b=AuJ2zOwSFgjJ97C13KoDZkhAOk5tBzAANmQacsJVSTvmI8RvTAbiMwSm578u3CMN6I
         aCzZgZFdYJTJfzVXwqmMVLzkCLTnNfQWyT0OrgiYLL5g+9Hrxj+NPwJ0iajzkLI2GcDs
         CZ8WO5oH37IxT+RcPgmGkSYNBIgj9gmWau+vpa+CqouZgKJQlv1jiUq7ZjCePd8fnS0Q
         Dhf06f5T7HeZXoHd3hqC3Rav00RAIPcdPV6I7svSLT4Ims5d4CCSs1uAap68uH056NDd
         2QY4Ba0ERZnFKqV/7RotZOtCPFZLlHefS7moaeAPiwxzqnwqVb+Y/oOqbxR67ySIlmP0
         GEnQ==
X-Gm-Message-State: AOAM5334Pi5H9VDl4PV3d+n+qhsL7KZ9O1guwEUP62ustrZyzv6XSdtI
        E+LzvxZnWQViA/kBvRdE+VrTuw==
X-Google-Smtp-Source: ABdhPJy1xVpW1w5F87b2nSunyyZc0bMYQ5iVOFHjEkOEzWQsdu1+jqx6f1ONGE/3/vVK8TXRzhZ6BA==
X-Received: by 2002:a17:90b:3594:: with SMTP id mm20mr3755250pjb.121.1606843177852;
        Tue, 01 Dec 2020 09:19:37 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id p14sm261792pjo.53.2020.12.01.09.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 09:19:36 -0800 (PST)
Subject: Re: [PATCH] menuconfig,mconf-cfg: Allow specification of ncurses
 location
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Broadcom Kernel Feedback List 
        <bcm-kernel-feedback-list@broadcom.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        OE-core <openembedded-core@lists.openembedded.org>,
        openembeded-devel <openembedded-devel@lists.openembedded.org>,
        Michal Marek <mmarek@suse.cz>
References: <20201128004505.27619-1-scott.branden@broadcom.com>
 <CAK7LNATD0J3C_mFrXAju8-WmdCmrPmRFn7Um0yebnfL-_zcu8w@mail.gmail.com>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <a5ea40a5-17ef-f037-16b3-177f01db6447@broadcom.com>
Date:   Tue, 1 Dec 2020 09:19:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNATD0J3C_mFrXAju8-WmdCmrPmRFn7Um0yebnfL-_zcu8w@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000dc8e3705b56a5432"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--000000000000dc8e3705b56a5432
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-CA

Hi Masahiro,

On 2020-12-01 4:25 a.m., Masahiro Yamada wrote:
> On Sat, Nov 28, 2020 at 9:45 AM Scott Branden
> <scott.branden@broadcom.com> wrote:
>> From: Bruce Ashfield <bruce.ashfield@windriver.com>
>>
>> In some cross build environments such as the Yocto Project build
>> environment it provides an ncurses library that is compiled
>> differently than the host's version.  This causes display corruption
>> problems when the host's curses includes are used instead of the
>> includes from the provided compiler are overridden.  There is a second
>> case where there is no curses libraries at all on the host system and
>> menuconfig will just fail entirely.
>>
>> The solution is simply to allow an override variable in
>> check-lxdialog.sh for environments such as the Yocto Project.  Adding
>> a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
>> compiling and linking against the right headers and libraries.
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> cc: Michal Marek <mmarek@suse.cz>
>> cc: linux-kbuild@vger.kernel.org
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>> ---
>
> Some people solve the cross-compiling in Yocto
> by using pkg-config.
>
>
> For example,
>
> commit 067c650c456e758f933aaf87a202f841d34be269
> Author: Pavel Modilaynen <pavel.modilaynen@axis.com>
> Date:   Fri Jul 12 13:52:19 2019 +0200
>
>     dtc: Use pkg-config to locate libyaml
>
>     Using Makefile's wildcard with absolute path to detect
>     the presence of libyaml results in false-positive
>     detection when cross-compiling e.g. in yocto environment.
>
>
>
> mconf-cfg.sh already allows the path flexibility with pkg-config.
> Why do you want yet another hook?
I hope the yocto community can provide more details on this patch.
The yocto environment isolates the build environment from the host tools.
Running menuconfig with the upstream kernel does not work on the latest yocto without this patch.
>>  scripts/kconfig/mconf-cfg.sh | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>  mode change 100755 => 100644 scripts/kconfig/mconf-cfg.sh
>>
>> diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
>> old mode 100755
>> new mode 100644
>> index aa68ec95620d..32448bc198a5
>> --- a/scripts/kconfig/mconf-cfg.sh
>> +++ b/scripts/kconfig/mconf-cfg.sh
>> @@ -4,6 +4,14 @@
>>  PKG="ncursesw"
>>  PKG2="ncurses"
>>
>> +if [ "$CROSS_CURSES_LIB" != "" ]; then
>> +    echo libs=\'$CROSS_CURSES_LIB\'
>> +    if [ x"$CROSS_CURSES_INC" != x ]; then
>> +       echo cflags=\'$CROSS_CURSES_INC\'
>> +    fi
>> +    exit 0
>> +fi
>> +
>>  if [ -n "$(command -v pkg-config)" ]; then
>>         if pkg-config --exists $PKG; then
>>                 echo cflags=\"$(pkg-config --cflags $PKG)\"
>> --
>> 2.17.1
>>
>


--000000000000dc8e3705b56a5432
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
I/3RRboOeC9M13VNr5feU91O0iDoMreAgPQJ0Lo7YrodKYug0Tt/fFDjkW3v3VIbEr2liUN69U0C
AwEAAaOCAdEwggHNMA4GA1UdDwEB/wQEAwIFoDCBngYIKwYBBQUHAQEEgZEwgY4wTQYIKwYBBQUH
MAKGQWh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzcGVyc29uYWxzaWduMnNo
YTJnM29jc3AuY3J0MD0GCCsGAQUFBzABhjFodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vZ3Nw
ZXJzb25hbHNpZ24yc2hhMmczME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEQGA1Ud
HwQ9MDswOaA3oDWGM2h0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NwZXJzb25hbHNpZ24yc2hh
MmczLmNybDAlBgNVHREEHjAcgRpzY290dC5icmFuZGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAK
BggrBgEFBQcDBDAfBgNVHSMEGDAWgBRpcoJiMWeVRIV3kYDEBDZJnXsLYTAdBgNVHQ4EFgQUWOK7
qiyDSt/IDm/SRcNi/sTEiyswDQYJKoZIhvcNAQELBQADggEBAEe2edd4F9tpp0GPmrFrQ+xp9kY7
uxBzPdCw588bgVrPemjLwiwV37XTT4iWJtNhPfEpaguM6jeLm58LCvHq5/IBjcyHyf4URQVwAg7B
pqkH8/M+IBstu4/D+znPHB59X+c+au3Q8D+xoNFd7I30kaE+oJuBuFsGXRBc0Ci+FM86x9k7SF8U
aui1E7Y9wDfsRSCL2TSwU773f09WkrvVdlKxNqQZj2z7bQUUn+yfXdFfBz0LqlYNfn7xJOpQE3HI
H4jq6U9+b0Qf+J0n0wyysjXPSeQ7EKXVkT8dM2KSpIN86v5dd9LkAz3C1dmjuPRGEC8ZhI1IjMBt
0itrn6C23NsxggJvMIICawIBATBtMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWdu
IG52LXNhMTMwMQYDVQQDEypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0g
RzMCDFtD165RQeUC8DvoCDANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQg1jHKelYf
WFmqo3Dkhwxcisi+BuOiRxuwU98YNkpGvfIwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkq
hkiG9w0BCQUxDxcNMjAxMjAxMTcxOTM4WjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjAL
BglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG
9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAEUFzR7aI1qxywMDaOO0U4qyCBSk
+Zs1iT3JIDSdA12pq3zIV2Cldp28mv2V79UTAv1KIwH+ufQ+o9/vIN1jOBKTrloT7CKybEX60PmF
i8VfRb9k3Gupbri0ZLFW3hHGCKaNoOIaQyPooTYgOgQEZKVdmMejrAUfom8dAt4Zxdegmifj9L39
vfTR7rttUjl5NCdBO3sD7B0Zz6Q4fRJZUeRtoroj8QMPnzoql7I4CrGHnTWRqFBGRUk/q5UcCgd6
Mcd7EaT9RKRqgCIpoPF8d9W5VFtOjCqBDFAWr0gS02zF1ycRH5zb1t00IDhP07s5yMlfZ8RxdOGE
fyKsLwPHiCE=
--000000000000dc8e3705b56a5432--
