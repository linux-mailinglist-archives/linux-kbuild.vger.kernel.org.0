Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6CA2F39A6
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 20:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405985AbhALTGp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 14:06:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405818AbhALTGp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 14:06:45 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A55A9C061786;
        Tue, 12 Jan 2021 11:06:04 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id f26so2915575qka.0;
        Tue, 12 Jan 2021 11:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Aih/vebqj0ZVCB2wb4N/cgF53cU8VglOtHrUsklmxqU=;
        b=JmpysSxXVkjlgM2RboM3NFHelC3OaY2pawo/Nu5vhHtBfGOllENBWcRn/b4PvAZWcR
         cIoLgYDXzIw04dGK3U1BHViukec/H10LzQGiPCL3k7/NymIMFUGnvExf5iHokBBUuwiT
         XyZSKCgGTnkhvtxZoE8zDmswBXmFVyBCxJw1SPyXlNfrcfvFyH0TLRejsAjvkXKZyiqh
         QaJvPOUFwGHMNLmIZToYxc+HTB/Ys0zpSJx1CfXRTjfDrf2AEsAaCoCFkdkEKL3H9TCx
         +crlKKnlRlBuXB8UD0F01TYZrv+Oog4BTEESlGUi26mh75u7baXweO51nPdnlEwpytJ4
         j4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Aih/vebqj0ZVCB2wb4N/cgF53cU8VglOtHrUsklmxqU=;
        b=k7tvEyLqLndDbj5u/8AvhMP4QiXv8XHmnjqYb6FSyhC8AXbC4Gpt2upwpXGP73/G+X
         jZgQeQT1Hmoro0xZtktHJ7g9SY1zfmUQCzmcIjuvNUvIJ3Nl5PcXuE02dvR93DPVCyRT
         yG3n9SdqU1HIuwS8B0KdZDEWKQi91RYgb5C6LrfauTnVW7O5Pqo8GOOPjiM5IuOg9JCn
         ZGF4QCnHRgAjDAklpa2OsW83MlwXgmi4z5ueNEQV0Q04Y+w8sODxUl2/kLEIFiXTw7fo
         pSD08zoqDVmNGx+t7A1cODeZuCIreNvdCd4shv1tx6xGuyocA+NeukSVGSTLRYt5nre/
         w2ug==
X-Gm-Message-State: AOAM532SJcfgyOt1wWnqFVux+U+0TpeXhyIK9nzxDX9vYobMtUpT6AXW
        d28BxJYTrgb3RxXjhRsd4fPl7IqdYYrY5Q==
X-Google-Smtp-Source: ABdhPJyG3FnkmfdCQqFzJYB5/4Fc5vznI53Hr2fgwqgRUdr1jgg41JUioOTrxV2OMnwxA0RjJ5O8ug==
X-Received: by 2002:a37:9a91:: with SMTP id c139mr799212qke.151.1610478363902;
        Tue, 12 Jan 2021 11:06:03 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id y67sm1805860qka.68.2021.01.12.11.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 11:06:03 -0800 (PST)
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <23e16d20-36eb-87d9-4473-142504ad8a95@gmail.com>
 <CAL_JsqKqSVGCjcue=ka2=bB1Os9pczNTCqDeaoFPFfRxnvsteQ@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <e549c7ce-d01e-08a3-9ed0-7325a34e9c29@gmail.com>
Date:   Tue, 12 Jan 2021 13:06:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKqSVGCjcue=ka2=bB1Os9pczNTCqDeaoFPFfRxnvsteQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/12/21 8:04 AM, Rob Herring wrote:
> On Mon, Jan 11, 2021 at 4:06 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>
>> On 1/8/21 2:41 AM, Viresh Kumar wrote:
>>> Now that fdtoverlay is part of the kernel build, start using it to test
>>> the unitest overlays we have by applying them statically.
>>>
>>> The file overlay_base.dtb have symbols of its own and we need to apply
>>> overlay.dtb to overlay_base.dtb alone first to make it work, which gives
>>> us intermediate-overlay.dtb file.
>>>
>>> The intermediate-overlay.dtb file along with all other overlays is them
>>> applied to testcases.dtb to generate the master.dtb file.
>>>
>>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>>
>> NACK to this specific patch, in its current form.
>>
>> There are restrictions on applying an overlay at runtime that do not apply
>> to applying an overlay to an FDT that will be loaded by the kernel during
>> early boot.  Thus the unittest overlays _must_ be applied using the kernel
>> overlay loading methods to test the kernel runtime overlay loading feature.
> 
> This patch doesn't take away from any of that and it completely orthogonal.

Mea culpa.  I took the patch header comment at face value, and read more into
the header comment than what was written there.  I then skimmed the patch
instead of actually reading what it was doing.

I incorrectly _assumed_ (bad!) that the intent was to replace applying the
individual overlay dtb's with the master.dtb.  Reading more closely, I see
that the assumed final step of actually _using_ master.dtb does not exist.

So, yes, I agree that the patch as written is orthogonal to my concern.

My updated understanding is that this patch is attempting to use the existing
unittest overlay dts files as source to test fdtoverlay.  And that the resulting
dtb from fdtoverlay is not intended to be consumed by the kernel unittest.

I do not agree that this is a good approach to testing fdtoverlay.  The
unittest overlay dts files are constructed specifically to test various
parts of the kernel overlay code and dynamic OF code.  Some of the content
of the overlays is constructed to trigger error conditions in that code,
and thus will not be able to be processed without error by fdtoverlay.

Trying to use overlay dts files that are constructed to test runtime kernel
code as fdtoverlay input data mixes two different test environments and
objectives.  If fdtoverlay test cases are desired, then fdtoverlay specific
dts files should be created.

> 
>> I agree that testing fdtoverlay is a good idea.  I have not looked at the
>> parent project to see how much testing of fdtoverlay occurs there, but I
>> would prefer that fdtoverlay tests reside in the parent project if practical
>> and reasonable.  If there is some reason that some fdtoverlay tests are
>> more practical in the Linux kernel repository then I am open to adding
>> them to the Linux kernel tree.
> 
> If you (or more importantly someone else sending us patches) make
> changes to the overlays, you can test that they apply at build time
> rather than runtime. I'll take it! So please help on fixing the issue
> because I want to apply this.

If the tests can be added to the upstream project, I would much prefer
they reside there.  If there is some reason a certain test is more
suited to be in the Linux kernel source tree then I also would like
it to be accepted here.

> 
> And yes, dtc has fdtoverlay tests. But this patch shows there's at
> least 2 issues,


> fdtoverlay can't apply overlays to the root 

A test of that definitely belongs in the upstream project.

> and using an overlay as the base tree in UML is odd IMO.

Am I still not fully understanding the patch?  I'm missing how
this patch changes what dtb is used as the base tree in UML.

> 
> Rob
> 

-Frank
