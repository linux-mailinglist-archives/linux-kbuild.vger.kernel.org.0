Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 939E217730D
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2020 10:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgCCJuL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Mar 2020 04:50:11 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33176 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728257AbgCCJuL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 04:50:11 -0500
Received: by mail-lj1-f194.google.com with SMTP id f13so2820716ljp.0
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Mar 2020 01:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=+pqUVa+iJKiYfmtbwFgOUkAfBLkxAe1OkEI8zp9rAOM=;
        b=ZxaMTWs2PhvP02bSlCREiq8B2pCaEG1FDmQey3np0Y3cOhBemusIY+fwbWw25gSUNa
         h2mhj89Mt8TCJ8Qi0hUnHnmMdpNTX4zjQEgAb9v7JnQqKzDBN85eINkJIvna0BCet6Jm
         VH+IR8wTtDn7WVRK9BsoPE5J1hib2/3KvG9e0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+pqUVa+iJKiYfmtbwFgOUkAfBLkxAe1OkEI8zp9rAOM=;
        b=iWO4Q/MLate4DlTjjG1RoFXyQLaIxM1MDbIw+y8/PyN7nPM6EHglZBXkYfUpxL3HAj
         Az1ta8lFZfPfB8mnn+lHCRuaucVVVlonYNp6ifrAUt4qS3eVI6an++Tde0wtcP55y2QP
         420hRhA/igTaaV185bDPhJVaShx/nVv2aN8H6awJWlPuycIm0x3NVxKKumRw8KO0Asty
         J2OSCrBtP5Uc+RZM3sTTe8cBB/jMwefYTLUgiySK1fNlfpCG6RFa2bx7hrwi4uqP8EJ7
         6XAdeI6OU4qWHY4w9XQVUpSmmwyDOX9bfZU/s9F5PIxNd6rVNlxLSBqqlKjE3hN2aEpi
         bvNA==
X-Gm-Message-State: ANhLgQ3G4gu2YsIpPR7AKCsGIJBGVSKCk9XMwQ1RP2xezD7JMtTCMnOR
        Ibc0lt+/x3ZZxbVvXuxeJ4UJgQ==
X-Google-Smtp-Source: ADFU+vtECDzXDFpXCG5lcJVJDyqu/tCMnJuWU9+mtWR65wiFN3A1cwYWg/gphR8f0TCrpSxAzIS25A==
X-Received: by 2002:a2e:9ca:: with SMTP id 193mr1862293ljj.283.1583229008833;
        Tue, 03 Mar 2020 01:50:08 -0800 (PST)
Received: from [172.16.11.50] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id n12sm234615ljm.69.2020.03.03.01.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2020 01:50:08 -0800 (PST)
Subject: Re: eh_frame confusion
To:     "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Segher Boessenkool <segher@kernel.crashing.org>
References: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
 <1583168442.ovqnxu16tp.naveen@linux.ibm.com>
 <1583169883.zo43kx69lm.naveen@linux.ibm.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <9c9f79e3-d355-1c8a-fb5b-169aab2945da@rasmusvillemoes.dk>
Date:   Tue, 3 Mar 2020 10:50:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1583169883.zo43kx69lm.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 02/03/2020 18.32, Naveen N. Rao wrote:
> Naveen N. Rao wrote:
>> Michael opened a task to look into this recently and I had spent some
>> time last week on this. The original commit/discussion adding
>> -fno-dwarf2-cfi-asm refers to R_PPC64_REL32 relocations not being
>> handled by our module loader:
>> http://lkml.kernel.org/r/20090224065112.GA6690@bombadil.infradead.org
>>
>> However, that is now handled thanks to commit 9f751b82b491d:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9f751b82b491d
>>
>>
>> I did a test build and a simple module loaded fine, so I think
>> -fno-dwarf2-cfi-asm is not required anymore, unless Michael has seen
>> some breakages with it. Michael?
>>
>>>
>>> but prior to gcc-8, .eh_frame didn't seem to get generated anyway.
>>>
>>> Can .eh_frame sections be discarded for modules (on ppc32 at least), or
>>> is there some magic that makes them necessary when building with gcc-8?
>>
>> As Segher points out, it looks like we need to add
>> -fno-asynchronous-unwind-tables. Most other architectures seem to use
>> that too.

Yes. Thanks, Segher, that explains that part.

> Can you check if the below patch works? I am yet to test this in more
> detail, but would be good to know the implications for ppc32.

I'll see if that produces a bootable kernel, but I think I'd prefer a
more piecemeal approach.

One patch to add -fno-asynchronous-unwind-tables (given that other
arches do it unconditionally I don't think cc-option is needed), with a
commit log saying something like "no-op for gcc < 8, prevents .eh_frame
sections that are discarded anyway for vmlinux and waste disk space for
modules". Then another patch can get rid of -fno-dwarf2-cfi-asm if
that's no longer required.

Rasmus
