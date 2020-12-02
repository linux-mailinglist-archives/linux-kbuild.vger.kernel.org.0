Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8592CB1A5
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Dec 2020 01:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgLBAnO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 19:43:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgLBAnO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 19:43:14 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EF5C0613D6
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Dec 2020 16:42:34 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id d77so106225pfd.2
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Dec 2020 16:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=305zA2UDnNyHaiLnHLht0TPkfvbn+0q/fFcdqVOLVXE=;
        b=S6bbP+0rp2UZX5iu6kV6a3QEH3TBjIbR/ck5adkezmvQ5kWERZEJsRnO8ZuSB8YRPd
         hk4YQkN0sljkYFHsr535F7B2j5Kj5jTMzrgqmSsQD8EUkloTpxCbn7wCmMJ+6rbwDDTQ
         kJGJiWlaZg9+p8qqZCSVmrR/P+TiiJfBi3H28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=305zA2UDnNyHaiLnHLht0TPkfvbn+0q/fFcdqVOLVXE=;
        b=k1c4zLVdkCj9D2IJLSFZ24FjX+ByH0OxuT4Bdf1PqzYt8GBquYwRi3MKvCy4shxco7
         zuPIyLpNPksVBqAOnuahQBtsnAh7IZlqmKYdp0FPIkmg0GOIQWzoaW09AMsJ6VChAUtW
         cUn3E2ttKe51A76KQaV0xd0kD1LQhlgu8zYMR3wWmlE2enRKE0PlrxVQz6I35TKAFs1B
         V+UXSYG/mK/C2pgHJjuNHmBE5R3skcr89WKfXP5MzEzoh6s21x+eI4hSZ5tsQ7hutZbu
         0Yo0iQgVzyt7NRwLKpOtXFLO4SOl7+udQbVAnqkUOmm1kbHAh1FB49UlSjc7R90DrAcg
         ZagQ==
X-Gm-Message-State: AOAM532efQgn0ogHf97Uvnw2YQ4kQLAKZuWAD4z1ov7b+76e4lU7t637
        WhIXHiGFd1XI3NsFREQXOSqo/g==
X-Google-Smtp-Source: ABdhPJwGk0kTX/+M1DEpYCf2yzuO2n8Fs1rf6SIXbJPl/NPALCYL7BBC9ow5svpGxDxICrzGAZqtOw==
X-Received: by 2002:a63:7103:: with SMTP id m3mr190562pgc.369.1606869753577;
        Tue, 01 Dec 2020 16:42:33 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id 22sm82949pjb.40.2020.12.01.16.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 16:42:32 -0800 (PST)
Subject: Re: [PATCH] menuconfig,mconf-cfg: Allow specification of ncurses
 location
To:     Bruce Ashfield <bruce.ashfield@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Broadcom Kernel Feedback List 
        <bcm-kernel-feedback-list@broadcom.com>,
        OE-core <openembedded-core@lists.openembedded.org>,
        openembeded-devel <openembedded-devel@lists.openembedded.org>,
        Michal Marek <mmarek@suse.cz>
References: <20201128004505.27619-1-scott.branden@broadcom.com>
 <CAK7LNATD0J3C_mFrXAju8-WmdCmrPmRFn7Um0yebnfL-_zcu8w@mail.gmail.com>
 <a5ea40a5-17ef-f037-16b3-177f01db6447@broadcom.com>
 <CADkTA4NTPJrvoFqumNjkU-o-ZTt8iVUzQec+=Qvm4J_59FFQqg@mail.gmail.com>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <be7e141b-4c20-c31b-9b74-6a1369569565@broadcom.com>
Date:   Tue, 1 Dec 2020 16:42:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NTPJrvoFqumNjkU-o-ZTt8iVUzQec+=Qvm4J_59FFQqg@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000e3482105b57084ea"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--000000000000e3482105b57084ea
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-CA

Hi Bruce,

On 2020-12-01 11:01 a.m., Bruce Ashfield wrote:
> On Tue, Dec 1, 2020 at 12:19 PM Scott Branden
> <scott.branden@broadcom.com> wrote:
>> Hi Masahiro,
>>
>> On 2020-12-01 4:25 a.m., Masahiro Yamada wrote:
>>> On Sat, Nov 28, 2020 at 9:45 AM Scott Branden
>>> <scott.branden@broadcom.com> wrote:
>>>> From: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>>
>>>> In some cross build environments such as the Yocto Project build
>>>> environment it provides an ncurses library that is compiled
>>>> differently than the host's version.  This causes display corruption
>>>> problems when the host's curses includes are used instead of the
>>>> includes from the provided compiler are overridden.  There is a second
>>>> case where there is no curses libraries at all on the host system and
>>>> menuconfig will just fail entirely.
>>>>
>>>> The solution is simply to allow an override variable in
>>>> check-lxdialog.sh for environments such as the Yocto Project.  Adding
>>>> a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
>>>> compiling and linking against the right headers and libraries.
>>>>
>>>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>>>> cc: Michal Marek <mmarek@suse.cz>
>>>> cc: linux-kbuild@vger.kernel.org
>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>>>> ---
>>> Some people solve the cross-compiling in Yocto
>>> by using pkg-config.
>>>
>>>
>>> For example,
>>>
>>> commit 067c650c456e758f933aaf87a202f841d34be269
>>> Author: Pavel Modilaynen <pavel.modilaynen@axis.com>
>>> Date:   Fri Jul 12 13:52:19 2019 +0200
>>>
>>>     dtc: Use pkg-config to locate libyaml
>>>
>>>     Using Makefile's wildcard with absolute path to detect
>>>     the presence of libyaml results in false-positive
>>>     detection when cross-compiling e.g. in yocto environment.
>>>
>>>
>>>
>>> mconf-cfg.sh already allows the path flexibility with pkg-config.
>>> Why do you want yet another hook?
>> I hope the yocto community can provide more details on this patch.
>> The yocto environment isolates the build environment from the host tools.
>> Running menuconfig with the upstream kernel does not work on the latest yocto without this patch.
> Sorry for not commenting on the origin patch, gmail buried it within
> some other threads, but luckily this one popped up.
>
> It is true that we've been carrying this for several years to deal with
> the fact that the native sysroot is not searched by the pkg-config
> called by mconf-cfg.sh (since it is separate from host and target
> pkg-config).
>
> As it turns out, in the past few weeks, we have come up with a way
> to inject those native sysroot components into pkg-config without
> the need for any changes to the scripts.
>
> Scott: if you try again the the latest oe-core, and are still seeing
> the problem with the mainline kernel, ping me, and we can see if
> the pkg-config fix isn't holding for you, at that point, yes, we may
> still need a hook like this to solve the problem.
Try reverting this kernel patch from linux-yocto and menuconfig will fail.

menuconfig actually did work with the upstream kernel until the yocto change below was introduced:
"cml1.bbclass: Handle ncurses-native being available via pkg-config"
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=master-next&id=ce447d70df386ca55ce1672478b245851556374e

> Cheers,
>
> Bruce
>
>
>
>>>>  scripts/kconfig/mconf-cfg.sh | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>  mode change 100755 => 100644 scripts/kconfig/mconf-cfg.sh
>>>>
>>>> diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
>>>> old mode 100755
>>>> new mode 100644
>>>> index aa68ec95620d..32448bc198a5
>>>> --- a/scripts/kconfig/mconf-cfg.sh
>>>> +++ b/scripts/kconfig/mconf-cfg.sh
>>>> @@ -4,6 +4,14 @@
>>>>  PKG="ncursesw"
>>>>  PKG2="ncurses"
>>>>
>>>> +if [ "$CROSS_CURSES_LIB" != "" ]; then
>>>> +    echo libs=\'$CROSS_CURSES_LIB\'
>>>> +    if [ x"$CROSS_CURSES_INC" != x ]; then
>>>> +       echo cflags=\'$CROSS_CURSES_INC\'
>>>> +    fi
>>>> +    exit 0
>>>> +fi
>>>> +
>>>>  if [ -n "$(command -v pkg-config)" ]; then
>>>>         if pkg-config --exists $PKG; then
>>>>                 echo cflags=\"$(pkg-config --cflags $PKG)\"
>>>> --
>>>> 2.17.1
>>>>
>


--000000000000e3482105b57084ea
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
RzMCDFtD165RQeUC8DvoCDANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgZQuCjUm0
4c9uAcJpKY9lj9AXEyaPssyF5QTN/qHRj4YwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkq
hkiG9w0BCQUxDxcNMjAxMjAyMDA0MjM0WjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjAL
BglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG
9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAJZWGKzqkmZ7h+iRHSkFUncIolCs
BdZaKyO+yb65P59ww8/u7qvIDChUKgp6B8trtcUIm23eseFbN6OYeDyTMG67nIfrk+VfKsjT/K23
h2EQclG7fhGjzAkm+p8ziwRJ3kK5P39sYARMNyWS/7Kh/Z7c+wYWXtVJZFyJCLIyfvPb95kpCK6e
cHf7bCc7e3ZbnPv91bk7aI6gJtJhFNgCxm2DmL1s2r6dZTDnYhxPZhXo8jGwT3C87KQINW7ogJB2
2uMnnlNUkB78rH5asq8tjOPJZqwdRbUtfFuBLKK7HLfVkq6yBcTaNrqosMVJ5byTN0riOZMB4nX8
L0sc/FD0CnQ=
--000000000000e3482105b57084ea--
