Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2DB18640F
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2019 16:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733259AbfHHOMG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Aug 2019 10:12:06 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:46237 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730993AbfHHOMG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 10:12:06 -0400
Received: from [192.168.1.110] ([77.4.95.67]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MV5G4-1hmPUV0eeM-00S9Te; Thu, 08 Aug 2019 16:12:01 +0200
Subject: Re: make_kernelconfig fails in OpenWRT buildroot
To:     Thomas Albers <thomas.gameiro@googlemail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <CALYGOBV9FERiui6mJDmQyAjaNASAOQ5z1k-6nCHQVB+c4XxmSw@mail.gmail.com>
 <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
 <CALYGOBVauUutGGc8HNvLwue58AJp5DxOuM8b30XDgfbqJkLo1w@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <50091cb8-37ee-4234-9fb8-47d148e36ed3@metux.net>
Date:   Thu, 8 Aug 2019 16:11:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALYGOBVauUutGGc8HNvLwue58AJp5DxOuM8b30XDgfbqJkLo1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:luCSRvk2U+YL05f7K92Gz3nCTaJOi8HamTPiLhxJ10ggDNOBTmo
 B/1fiR6OGHL6rVigMeP/OC1vc4qRpaZfwc+0+JvAFlWMu7OdGTMSYhWIbO4HtWWN2aAL/iO
 o+vYRTthKOTTcIn4k7T6lAUj5e4abqpFxpmRzXvxdtBl5fcnusxxiNKjuy1zmS/5BAnoMkg
 +7Inghm02v2s/a5x8Dqyg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f7GjDlbjJbw=:ge+OxZmre5I3aPVCJu3gVy
 ppQGn0ucq3naLl08DPQEkl8TpvRhHuwczxT0JDoKaIymmN6H+o4ehYSpr+ZyX45bFoda/YHrO
 FXYoi0r6W8LziEB0EkkJl+pa5aWXjSyvAEVRK1lcrLo02zzH4zN+KHyXgwou6Hvf4ETRyu3YM
 F6S1PasIstf9pKMQJYXGEQP3+n1dG7RbnxFD3+NxIc+pFRmInU2K2byUYXm9cWJe/7zG8KUy/
 OziVWlw1x0xc3UUkQbqCpMpB8JhC/K+MHonSbiCGbm9aDc59a4/bfeQDLvOwnd3nimp3Aesqz
 bqw5lAtDgnNtiS8QGyzyLNxBDhPC8MckGk0d0uIKi52nPSDJH0f66RLjpNctuiKtS1bkBe5Ef
 6pPcYoX6ZYS/gl8QEbLVvsq9D4XJFJyGTbnEKXFjNpveyj8MoTmiFxy5HmPnAEKpvu1FpCK5D
 sffqL1h/NJMNGFxX6w9wVGzk3os55AVSPWUIgm3DOTV7THy+Z92TM2y/1saNdNdbZ8y5CYIOF
 abHDx8VUE34rR8ghanFSm+ZvoJnyzgCmjdsNKdr0Sb7Fc117cYF0C9cvIuEbMjTXh4ogehExu
 WcIWV4/G3U5k9uneO5x58kq1aNZX66LaVvETLAqZ8DEva2gd1W18NIooMm7CdPGFJ+NnupsJI
 QDES3r8NeI1ws3M1xVfrgYCM7w3jFefd+vwPvXUxsDE4j8+apRe9fKXqBv6aRZ62uGNSnoRBi
 w4BQOOJse7uV+5X/SXskvHJ0Fe/ahpHXi2Nvi3UGr2egA6SrsNLb4hPaXlk=
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 04.08.19 19:08, Thomas Albers wrote:

Hi,

> Somehow, kconfig is not linked against libtinfow. Please let me know
> how I can be of assistance here, I'm still wrapping my head around the
> code. This is a 4.14 kernel, but 4.19, which different architectures
> use, fails in a similar manner.

can you make sure you don't have any ncurses pieces in your sysroot and
retry ?


--mtx


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
