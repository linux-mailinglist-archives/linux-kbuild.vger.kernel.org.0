Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E54073F16FA
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 12:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237806AbhHSKDF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Aug 2021 06:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238051AbhHSKDF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Aug 2021 06:03:05 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FB79C061575
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Aug 2021 03:02:29 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id x10so8174820wrt.8
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Aug 2021 03:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FJuMRe5kb1JvgUgFNZUn5Lcxof2ueFSpC6SJl/1L8JQ=;
        b=LuQTp231BMa4P6ZCibX62HDHFlGtLR15MOvb2vOMrfj60dgDZ54FVG0zcAuEctonju
         9CHTYK+O+5o4ct3KjpV/JFsvf2hy0Qd85VO/H9u2PJvdb58Xe/aTqQfX5g2P+gUAG4vb
         6RuAzKNQT2wYYMkN+VORGm5SrvH95SIkb6zanslGCwINnm8/nC95fkb0VfHp95y8xW1q
         UYDtNFTNOK/50JSzjcPi2r6cLfvpCR3U/V0fMwvVePM09zZtkifEQvZRVXfeFlxN3cNH
         xHKeBMeNrVv4dClxQsoE1arGYYahWBXNt2CcNuSYhKu5jg0yb3dFUdPuiEe33TDo/vfh
         zpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FJuMRe5kb1JvgUgFNZUn5Lcxof2ueFSpC6SJl/1L8JQ=;
        b=nSJmFb+i4dT0L+olRczweRC8VXe+Arnx4mIMRT5eqLMNQgpefGbWRbrQkjO4B71jx1
         /sKvyJLPVJlILJShKejDoQfws/4V1NLKaCmYBHHPl9kxpXQGv+Slaqtki9J+TMGmYcpF
         SQJKImBKcoMhLSwpk8EnlmXnrhetbWeA8k4YAqsFr/5ARSyrGyg+jvDbqdLqfE17I4zH
         MhlDy2HBKm2tOFKOTR/ZPxA8Ja88W1GoZY/qpeW7/KR5O48v3hk2g3QOOsE8tnAfqlS8
         bU2s74yP1BZ3D+ghsanuGOAnY/dM/pnqMpQPTMhxyNkVDTj5qG9JgSphzTHX0a06gzYb
         6E0w==
X-Gm-Message-State: AOAM530WoB8uispFLzk03luRUlhtRFWvti6Hju2gjj9x5R8ILCKw6ZJ/
        IbQUInYvWm+DbL0eW0aQQjRVcg==
X-Google-Smtp-Source: ABdhPJxAqnOpMv5auNzh4QNvVPUNqVU4zj54j14k0a+ZxxHZmDS9bBmn96ft4weoVYlDZrqL0xJATw==
X-Received: by 2002:adf:f748:: with SMTP id z8mr2776052wrp.25.1629367347598;
        Thu, 19 Aug 2021 03:02:27 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:12cc:ffac:3aeb:8cf3? ([2a01:e34:ed2f:f020:12cc:ffac:3aeb:8cf3])
        by smtp.googlemail.com with ESMTPSA id c9sm2519595wrm.43.2021.08.19.03.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 03:02:26 -0700 (PDT)
Subject: Re: [PATCH][RESEND] tools/thermal/tmon: simplify Makefile and fix
 cross build
To:     Jiri Kosina <jikos@kernel.org>, Rolf Eike Beer <eb@emlix.com>
Cc:     linux-acpi@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Markus Mayer <mmayer@broadcom.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Olsa <jolsa@kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>
References: <2149399.oOxd0sxVbX@devpool47>
 <nycvar.YFH.7.76.2108191140000.8253@cbobk.fhfr.pm>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <df0349e5-ff89-23a9-7853-5f830c5d43f9@linaro.org>
Date:   Thu, 19 Aug 2021 12:02:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2108191140000.8253@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Hi Jiri,

On 19/08/2021 11:40, Jiri Kosina wrote:
> On Fri, 30 Jul 2021, Rolf Eike Beer wrote:
> 
>> Hi,
>>
>> cross-building tmon can fail because it uses the non-prefixed, i.e. host, pkg-
>> config.
>>
>> If you prefer a merge the code is also available at:
>>
>>    https://github.com/emlix/linux thermal-makefile
>>
>> Would be nice if someone could finally pick this up, it's almost 3 years now…
>>
>> If someone knows anyone who better fits into these reviews please add CC's, 
>> sadly tools/thermal/ is not covered in MAINTAINERS.
> 
> That would be Daniel Lezcano. CCing.

I sent a patch for that

https://lkml.org/lkml/2021/8/14/152

and applied the series


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
