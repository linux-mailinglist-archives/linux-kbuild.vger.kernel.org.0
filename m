Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 363EC863EA
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2019 16:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729203AbfHHOJk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Aug 2019 10:09:40 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:53681 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfHHOJj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 10:09:39 -0400
Received: from [192.168.1.110] ([77.4.95.67]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MEmpp-1i7WgH2Til-00GMMx; Thu, 08 Aug 2019 16:09:34 +0200
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: make_kernelconfig fails in OpenWRT buildroot
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thomas Albers <thomas.gameiro@googlemail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <CALYGOBV9FERiui6mJDmQyAjaNASAOQ5z1k-6nCHQVB+c4XxmSw@mail.gmail.com>
 <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
Organization: metux IT consult
Message-ID: <892b823a-a319-f9d1-51c0-5bf11b291e4c@metux.net>
Date:   Thu, 8 Aug 2019 16:09:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:gTG8HWPyddjfWJ5uzbsyD3tWHyy/tpf362FNElQWdK9RPSqSK/d
 /HzjgnGtnuo0E6NUuxek59xpt1k15md0qhkLYcicG6XQBhO+VGAyrT3FBU8HzBKxxIMDRDZ
 Uwebz9w9FSg/nCILKB8uZJsds/hm/bezMhirGD9iDHvBs3dJwhd1KN4aH4gFSU1qEvnZNG8
 hEnfKvm1KlVdNWBusDrHQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/yFjdSyBotQ=:4z6QTXQD8S6po/U4y+2UFj
 DtBSwmxpdPacwbDw1aoVJ6HX/hxqFd38jmxYtIcVDXXqmVOU0wncITBGKSlonPDw4x+uraEvq
 vGdn/q7tMBJvpV5HGOCGCmqUQoTMWL2AtfhMzbfCOILh1Qs0r0g0MjcR1mmyBodyf6GHAzDC4
 TxuIuKpHXryqomqq33XlVwlXdR//7XjfY06h68Cfo5g4S/wF3MfgxSM/AHONiSoiBjl+ul6DY
 UNFPe/lI42TSYQ7I+QTAEkWBfiBxFhbCZItiCzVpyHWbYzYsPMfwJMZwK6lFDp4S0cmfzXO96
 fzSfV/cm4+EDctwo/tfhhRI61dmiHCSPNpCvlVhP/cVhpkTG1pA8Y4b79JsAtHzd8+CaHhSe8
 0gCoN3iIRiQp54BAjJ1+sBsG+yASfZova8+WeVWAIm1NS9b+2GfMtOyoxPCZfepMPou9in7Ky
 gTv45i07QE3Hyq5nAs9oNGNRTIze+W6jHm14bGurL/WCxtHLI6bbqP45ZYBCPBtN4wVuzCdV9
 UP+KjK3GnGHehtcztIp6cJv6zcRZ1CstuEbKl9HFmioM6Cd6cKTCwjsJx4xovFrB6pYnsSJ+R
 L0fi0DHVubSTV0V8Xz4tEO/c2qN02drGW5NpqdugxDwbkFrDrleBMuIMkVbZ87qKUgR/wt3v4
 wgLW+Y2jtINU23BteDAnbdP8G9nsJMpcSXiKjWkuP9wQQnqVB+yClfPKoeLUIPGt7k4AGKnWg
 5k2appvUifZdPN4rwnXMSqqFf562mWLTQT8fgcMFRIgM6mezNJKzdiplAVU=
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 04.08.19 05:57, Masahiro Yamada wrote:

Hi,

> See line 7-20 of scripts/kconfig/mconf-cfg.sh,
> it tries pkg-config first. If pkg-config cannot find ncurses,
> it falls back to some hard-coded install paths.

Whoooh! One of the most important lessons I've learned aeons ago when 
crosscompiling comes in:

Always use pkg-config exclusively, whenever you can (in worst case,
let distros add .pc files to packages that yet miss it) and *never*
try to guess anything.

Crosscompile environments need to tweak a lot of things, especially
pathes - pkg-config is the perfect central knob for that (aeons ago
I've added sysroot support to pkg-config, so it automatically adds the
sysroot prefix to all pathes).

Note that we have two pkg-config instances (.pc file sets) involved
here: one for the target, one for the host. (in crosscompile 
environment, $HOST_PKG_CONFIG shall give the command for the host,
$PKG_CONFIG for the target).

Not sure why the pkg-config doesn't find ncurses in this case, but
I suspect a mixup between host and target.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
