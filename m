Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2CF310945
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Feb 2021 11:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231432AbhBEKiP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 05:38:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbhBEKgJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 05:36:09 -0500
X-Greylist: delayed 500 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 05 Feb 2021 02:35:22 PST
Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch [IPv6:2001:1600:3:17::bc0b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4003C0617A7
        for <linux-kbuild@vger.kernel.org>; Fri,  5 Feb 2021 02:35:22 -0800 (PST)
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
        by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4DXBRj2YVDzMqWkX;
        Fri,  5 Feb 2021 11:26:57 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4DXBRf1R7Xzlh8TK;
        Fri,  5 Feb 2021 11:26:54 +0100 (CET)
Subject: =?UTF-8?Q?Re=3a_Conflict_with_Micka=c3=abl_Sala=c3=bcn=27s_blacklis?=
 =?UTF-8?Q?t_patches_=5bwas_=5bPATCH_v5_0/4=5d_Add_EFI=5fCERT=5fX509=5fGUID_?=
 =?UTF-8?Q?support_for_dbx/mokx_entries=5d?=
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     David Howells <dhowells@redhat.com>, dwmw2@infradead.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
        lszubowi@redhat.com, javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Tyler Hicks <tyhicks@linux.microsoft.com>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
 <1103491.1612369600@warthog.procyon.org.uk>
 <10e6616e-0598-9f33-2de9-4a5268bba586@digikod.net>
 <A5B5DEC0-E47A-4C3D-8E79-AF37B6C2E565@oracle.com>
 <7924ce4c-ea94-9540-0730-bddae7c6af07@digikod.net>
 <BFC930B3-7994-4C5B-A8EF-1DD1C73F5750@oracle.com>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <dc6a4524-3935-fda6-40a8-cebf80942cdf@digikod.net>
Date:   Fri, 5 Feb 2021 11:27:02 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <BFC930B3-7994-4C5B-A8EF-1DD1C73F5750@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 05/02/2021 01:24, Eric Snowberg wrote:
> 
>> On Feb 4, 2021, at 1:26 AM, Mickaël Salaün <mic@digikod.net> wrote:
>>
>>
>> On 04/02/2021 04:53, Eric Snowberg wrote:
>>>
>>>> On Feb 3, 2021, at 11:49 AM, Mickaël Salaün <mic@digikod.net> wrote:
>>>>
>>>> This looks good to me, and it still works for my use case. Eric's
>>>> patchset only looks for asymmetric keys in the blacklist keyring, so
>>>> even if we use the same keyring we don't look for the same key types. My
>>>> patchset only allows blacklist keys (i.e. hashes, not asymmetric keys)
>>>> to be added by user space (if authenticated), but because Eric's
>>>> asymmetric keys are loaded with KEY_ALLOC_BYPASS_RESTRICTION, it should
>>>> be OK for his use case.  There should be no interference between the two
>>>> new features, but I find it a bit confusing to have such distinct use of
>>>> keys from the same keyring depending on their type.
>>>
>>> I agree, it is a bit confusing.  What is the thought of having a dbx 
>>> keyring, similar to how the platform keyring works?
>>>
>>> https://www.spinics.net/lists/linux-security-module/msg40262.html
>>>
>>>
>>>> On 03/02/2021 17:26, David Howells wrote:
>>>>>
>>>>> Eric Snowberg <eric.snowberg@oracle.com> wrote:
>>>>>
>>>>>> This is the fifth patch series for adding support for 
>>>>>> EFI_CERT_X509_GUID entries [1].  It has been expanded to not only include
>>>>>> dbx entries but also entries in the mokx.  Additionally my series to
>>>>>> preload these certificate [2] has also been included.
>>>>>
>>>>> Okay, I've tentatively applied this to my keys-next branch.  However, it
>>>>> conflicts minorly with Mickaël Salaün's patches that I've previously merged on
>>>>> the same branch.  Can you have a look at the merge commit
>>>>>
>>>>> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?h=keys-next&id=fdbbe7ceeb95090d09c33ce0497e0394c82aa33d
>>>>>
>>>>> 	(the top patch of my keys-next branch)
>>>>>
>>>>> to see if that is okay by both of you?  If so, can you give it a whirl?
>>>
>>>
>>> I’m seeing a build error within blacklist_hashes_checked with
>>> one of my configs.
>>>
>>> The config is as follows:
>>>
>>> $ grep CONFIG_SYSTEM_BLACKLIST_HASH_LIST .config
>>> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=“revocation_list"
>>>
>>> $ cat certs/revocation_list
>>> "tbs:1e125ea4f38acb7b29b0c495fd8e7602c2c3353b913811a9da3a2fb505c08a32”
>>>
>>> make[1]: *** No rule to make target 'revocation_list', needed by 'certs/blacklist_hashes_checked'.  Stop.
>>
>> It requires an absolute path.
> 
> Ok, if I use an absolute path now with CONFIG_SYSTEM_BLACKLIST_HASH_LIST 
> it works.
> 
>> This is to align with other variables
>> using the config_filename macro: CONFIG_SYSTEM_TRUSTED_KEYS,
>> CONFIG_MODULE_SIG_KEY and now CONFIG_SYSTEM_REVOCATION_KEYS.
> 
> I just did a quick test with CONFIG_SYSTEM_TRUSTED_KEYS. It looks like we 
> can use either a relative or absolute path with CONFIG_SYSTEM_TRUSTED_KEYS. 
> Shouldn’t this be consistent?

CONFIG_SYSTEM_TRUSTED_KEYS (and similar config) works with relative path
to $(srctree) not $(srctree)/certs as in your example.

We can make CONFIG_SYSTEM_BLACKLIST_HASH_LIST works with $(srctree) with
this patch:

diff --git a/certs/Makefile b/certs/Makefile
index eb45407ff282..92a233eaa926 100644
--- a/certs/Makefile
+++ b/certs/Makefile
@@ -14,6 +14,8 @@ $(eval $(call config_filename,SYSTEM_BLACKLIST_HASH_LIST))

 $(obj)/blacklist_hashes.o: $(obj)/blacklist_hashes_checked

+CFLAGS_blacklist_hashes.o += -I$(srctree)
+
 targets += blacklist_hashes_checked


> 
>> Cf. https://lore.kernel.org/lkml/1221725.1607515111@warthog.procyon.org.uk/
>>
>> We may want to patch scripts/kconfig/streamline_config.pl for both
>> CONFIG_SYSTEM_REVOCATION_KEYS and CONFIG_SYSTEM_BLACKLIST_HASH_LIST, to
>> warn user (and exit with an error) if such files are not found.
> 
