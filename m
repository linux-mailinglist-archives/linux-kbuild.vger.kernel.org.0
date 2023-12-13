Return-Path: <linux-kbuild+bounces-333-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 781A380DE44
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 23:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CD28281ACD
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 22:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF1BA950;
	Mon, 11 Dec 2023 22:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NCGa5kMn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98CBBC2;
	Mon, 11 Dec 2023 14:31:01 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBLXMVH013620;
	Mon, 11 Dec 2023 22:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Mprlzhxy8D3sf5tgMAGeJPXO/kIFEz/prOkhtEtEXs8=; b=NC
	Ga5kMneIfhg8l44icH+KA7y/Bx2quANHKbPRvHI7eF0IF++XGkUBSSUbkJGa9fnB
	g6WNDcMkCntmzuMbGjomPDCnv2iQ4YQnzFN6QnLHkIHwRshGJfSc/TWGRJOMnXvt
	RAn/v+pREGrwJU8q2l8Ill8o0oIqwFwRA+dEDWWPIwCGVIB5Np9RMg99n8iSTKKz
	tO3YCuEI0YZlpxdMdSUZR6PjA71nMdbiXx3UJgOmX46gMRsSOCb6cGURQK353/IY
	V/2wV5GtZzOUTPi0jOTh7MJkixSky5w7OX1iDNOitLQVPm9oOyHr0qKQ7C+p8Me/
	KzAaZ9HHPVKZokGb9uzA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uwjyjtx48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 22:30:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBMUNsm020259
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 22:30:23 GMT
Received: from [10.110.2.246] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 14:30:18 -0800
Message-ID: <1889fb67-97fe-4f09-9f29-6563ddfe0603@quicinc.com>
Date: Mon, 11 Dec 2023 14:30:17 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] check-uapi: Introduce check-uapi.sh
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers
	<ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        "Jonathan
 Corbet" <corbet@lwn.net>, <linux-kbuild@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <kernel@quicinc.com>,
        Randy Dunlap
	<rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson
	<andersson@kernel.org>, Todd Kjos <tkjos@google.com>,
        Matthias Maennich
	<maennich@google.com>,
        Giuliano Procida <gprocida@google.com>, <kernel-team@android.com>,
        <libabigail@sourceware.org>, Dodji Seketeli
	<dodji@redhat.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Jordan Crouse
	<jorcrous@amazon.com>
References: <20231027193016.27516-1-quic_johmoo@quicinc.com>
 <20231027193016.27516-2-quic_johmoo@quicinc.com>
 <CAK7LNATWk8psXZvsHXNwxNt9=sUi3J0qOA-P4ceOKqBuS1_VJQ@mail.gmail.com>
From: John Moon <quic_johmoo@quicinc.com>
In-Reply-To: <CAK7LNATWk8psXZvsHXNwxNt9=sUi3J0qOA-P4ceOKqBuS1_VJQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AxPM3C-w8FmZm-b41P55HrAVKjm-RcUm
X-Proofpoint-ORIG-GUID: AxPM3C-w8FmZm-b41P55HrAVKjm-RcUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312110185

On 11/14/2023 2:10 AM, Masahiro Yamada wrote:
> On Sat, Oct 28, 2023 at 4:31 AM John Moon <quic_johmoo@quicinc.com> wrote:
>>
>> While the kernel community has been good at maintaining backwards
>> compatibility with kernel UAPIs, it would be helpful to have a tool
>> to check if a commit introduces changes that break backwards
>> compatibility.
>>
>> To that end, introduce check-uapi.sh: a simple shell script that
>> checks for changes to UAPI headers using libabigail.
>>
>> libabigail is "a framework which aims at helping developers and
>> software distributors to spot some ABI-related issues like interface
>> incompatibility in ELF shared libraries by performing a static
>> analysis of the ELF binaries at hand."
>>
>> The script uses one of libabigail's tools, "abidiff", to compile the
>> changed header before and after the commit to detect any changes.
>>
>> abidiff "compares the ABI of two shared libraries in ELF format. It
>> emits a meaningful report describing the differences between the two
>> ABIs."
>>
>> The script also includes the ability to check the compatibility of
>> all UAPI headers across commits. This allows developers to inspect
>> the stability of the UAPIs over time.
>>
>> Signed-off-by: John Moon <quic_johmoo@quicinc.com>
>> ---
>>      - Add abidiff suppressions to filter out common things like enum
>>        variants named .*_MAX being changed and expansion into padding
>>        fields.
>>      - Bump minimum abidiff version to 2.4 to accomodate new
>>        suppressions.
>>      - Add option (-i) to suppress ambiguous breaking changes.
>>      - Remove printing of full file diffs when ABI breakage is found
>>        as this was too noisy.
>>      - Wait for all files to be checked before printing results as
>>        printing from parallel threads was garbling output.
>>      - Suppress all output when -q is passed.
>>      - Avoid messing up user's git tree by using "git archive" instead
>>        of checking out references.
> 
> 
> 
> The code looks almost good to me.
> 
> (I left some more comments below, but they are minor).
> 
>

Thanks - ACKing your comments. I'll send a v7 shortly which addresses them.

> 
> Greg,
> Could you check the output from the tool?
> Is it OK with you?
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
>>
>>   scripts/check-uapi.sh | 585 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 585 insertions(+)
>>   create mode 100755 scripts/check-uapi.sh
>>
>> diff --git a/scripts/check-uapi.sh b/scripts/check-uapi.sh
>> new file mode 100755
>> index 000000000000..bcb03c8dae60
>> --- /dev/null
>> +++ b/scripts/check-uapi.sh
>> @@ -0,0 +1,585 @@
>> +#!/bin/bash
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +# Script to check commits for UAPI backwards compatibility
>> +
>> +set -o errexit
>> +set -o pipefail
>> +
>> +print_usage() {
>> +       name=$(basename "$0")
>> +       cat << EOF
>> +$name - check for UAPI header stability across Git commits
>> +
>> +By default, the script will check to make sure the latest commit (or current
>> +dirty changes) did not introduce ABI changes when compared to HEAD^1. You can
>> +check against additional commit ranges with the -b and -p options.
>> +
>> +The script will not check UAPI headers for architectures other than the one
>> +defined in ARCH.
>> +
>> +Usage: $name [-b BASE_REF] [-p PAST_REF] [-j N] [-l ERROR_LOG] [-i] [-q] [-v]
>> +
>> +Options:
>> +    -b BASE_REF    Base git reference to use for comparison. If unspecified or empty,
>> +                   will use any dirty changes in tree to UAPI files. If there are no
>> +                   dirty changes, HEAD will be used.
>> +    -p PAST_REF    Compare BASE_REF to PAST_REF (e.g. -p v6.1). If unspecified or empty,
>> +                   will use BASE_REF^1. Must be an ancestor of BASE_REF. Only headers
>> +                   that exist on PAST_REF will be checked for compatibility.
>> +    -j JOBS        Number of checks to run in parallel (default: number of CPU cores).
>> +    -l ERROR_LOG   Write error log to file (default: no error log is generated).
>> +    -i             Ignore ambiguous changes that may or may not break UAPI compatibility.
>> +    -q             Quiet operation.
>> +    -v             Verbose operation (print more information about each header being checked).
>> +
>> +Environmental args:
>> +    ABIDIFF  Custom path to abidiff binary
>> +    CC       C compiler (default is "gcc")
>> +    ARCH     Target architecture of C compiler (default is host arch)
> 
> 
> 
> ARCH is not the arch of C compiler.
> It is the arch for the UAPI check.
> 
> It is better to reword it.
> 
> 
> 
> 
> 
> 
>> +
>> +Exit codes:
>> +    $SUCCESS) Success
>> +    $FAIL_ABI) ABI difference detected
>> +    $FAIL_PREREQ) Prerequisite not met
>> +EOF
>> +}
>> +
>> +readonly SUCCESS=0
>> +readonly FAIL_ABI=1
>> +readonly FAIL_PREREQ=2
>> +
>> +# Print to stderr
>> +eprintf() {
>> +       # shellcheck disable=SC2059
>> +       printf "$@" >&2
>> +}
>> +
>> +# Expand an array with a specific character (similar to Python string.join())
>> +join() {
>> +       local IFS="$1"
>> +       shift
>> +       printf "%s" "$*"
>> +}
>> +
>> +# Create abidiff suppressions
>> +gen_suppressions() {
>> +       # Common enum variant names which we don't want to worry about
>> +       # being shifted when new variants are added.
>> +       local -a enum_regex=(
>> +               ".*_AFTER_LAST$"
>> +               ".*_CNT$"
>> +               ".*_COUNT$"
>> +               ".*_END$"
>> +               ".*_LAST$"
>> +               ".*_MASK$"
>> +               ".*_MAX$"
>> +               ".*_MAX_BIT$"
>> +               ".*_MAX_BPF_ATTACH_TYPE$"
>> +               ".*_MAX_ID$"
>> +               ".*_MAX_SHIFT$"
>> +               ".*_NBITS$"
>> +               ".*_NETDEV_NUMHOOKS$"
>> +               ".*_NFT_META_IIFTYPE$"
>> +               ".*_NL80211_ATTR$"
>> +               ".*_NLDEV_NUM_OPS$"
>> +               ".*_NUM$"
>> +               ".*_NUM_ELEMS$"
>> +               ".*_NUM_IRQS$"
>> +               ".*_SIZE$"
>> +               ".*_TLSMAX$"
>> +               "^MAX_.*"
>> +               "^NUM_.*"
>> +       )
>> +
>> +       # Common padding field names which can be expanded into
>> +       # without worrying about users.
>> +       local -a padding_regex=(
>> +               ".*end$"
>> +               ".*pad$"
>> +               ".*pad[0-9]?$"
>> +               ".*pad_[0-9]?$"
>> +               ".*padding$"
>> +               ".*padding[0-9]?$"
>> +               ".*padding_[0-9]?$"
>> +               ".*res$"
>> +               ".*resv$"
>> +               ".*resv[0-9]?$"
>> +               ".*resv_[0-9]?$"
>> +               ".*reserved$"
>> +               ".*reserved[0-9]?$"
>> +               ".*reserved_[0-9]?$"
>> +               ".*rsvd[0-9]?$"
>> +               ".*unused$"
>> +       )
>> +
>> +       cat << EOF
>> +[suppress_type]
>> +  type_kind = enum
>> +  changed_enumerators_regexp = $(join , "${enum_regex[@]}")
>> +EOF
>> +
>> +       for p in "${padding_regex[@]}"; do
>> +               cat << EOF
>> +[suppress_type]
>> +  type_kind = struct
>> +  has_data_member_inserted_at = offset_of_first_data_member_regexp(${p})
>> +EOF
>> +       done
>> +
>> +if [ "$IGNORE_AMBIGUOUS_CHANGES" = "true" ]; then
>> +       cat << EOF
>> +[suppress_type]
>> +  type_kind = struct
>> +  has_data_member_inserted_at = end
>> +  has_size_change = yes
>> +EOF
>> +fi
>> +}
>> +
>> +# Check if git tree is dirty
>> +tree_is_dirty() {
>> +       ! git diff --quiet
>> +}
>> +
>> +# Get list of files installed in $ref
>> +get_file_list() {
>> +       local -r ref="$1"
>> +       local -r tree="$(get_header_tree "$ref")"
>> +
>> +       # Print all installed headers, filtering out ones that can't be compiled
>> +       find "$tree" -type f -name '*.h' -printf '%P\n' | grep -v -f "$INCOMPAT_LIST"
>> +}
>> +
>> +# Add to the list of incompatible headers
>> +add_to_incompat_list() {
>> +       local -r ref="$1"
>> +
>> +       # Start with the usr/include/Makefile to get a list of the headers
>> +       # that don't compile using this method.
>> +       if [ ! -f usr/include/Makefile ]; then
>> +               eprintf "error - no usr/include/Makefile present at %s\n" "$ref"
>> +               eprintf "Note: usr/include/Makefile was added in the v5.3 kernel release\n"
>> +               exit "$FAIL_PREREQ"
>> +       fi
>> +       {
>> +               # shellcheck disable=SC2016
>> +               printf 'all: ; @echo $(no-header-test)\n'
>> +               cat usr/include/Makefile
>> +       } | SRCARCH="$ARCH" make --always-make -f - | tr " " "\n" \
>> +         | grep -v "asm-generic" >> "$INCOMPAT_LIST"
>> +
>> +       # The makefile also skips all asm-generic files, but prints "asm-generic/%"
>> +       # which won't work for our grep match. Instead, print something grep will match.
>> +       printf "asm-generic/.*\.h\n" >> "$INCOMPAT_LIST"
>> +
>> +       sort -u -o "$INCOMPAT_LIST" "$INCOMPAT_LIST"
>> +       sed -i -e '/^$/d' "$INCOMPAT_LIST"
> 
> 
> 
> Maybe, you can move these two lines to the
> end of install_headers().
> 
> The reason for the duplication is because
> run_make_headers_install() is executed twice.
> 
> You do not need to sort INCOMPAT_LIST
> in the first run of run_make_headers_install().
> 
> 
> 
> 
> 
>> +}
>> +
>> +# Compile the simple test app
>> +do_compile() {
>> +       local -r inc_dir="$1"
>> +       local -r header="$2"
>> +       local -r out="$3"
>> +       printf "int main(void) { return 0; }\n" | \
>> +               "$CC" -c \
>> +                 -o "$out" \
>> +                 -x c \
>> +                 -O0 \
>> +                 -std=c90 \
>> +                 -fno-eliminate-unused-debug-types \
>> +                 -g \
>> +                 "-I${inc_dir}" \
>> +                 -include "$header" \
>> +                 -
>> +}
>> +
>> +# Run make headers_install
>> +run_make_headers_install() {
>> +       local -r install_dir="$1"
> 
> 
> 
> You can call get_header_tree() here,
> and pass "$ref" to this function.
> 
> 
> 
> 
> 
>> +       make -j "$MAX_THREADS" ARCH="$ARCH" INSTALL_HDR_PATH="$install_dir" \
>> +               headers_install > /dev/null
>> +}
>> +
>> +# Install headers for both git refs
>> +install_headers() {
>> +       local -r base_ref="$1"
>> +       local -r past_ref="$2"
>> +
>> +       for ref in "$base_ref" "$past_ref"; do
>> +               printf "Installing user-facing UAPI headers from %s... " "${ref:-dirty tree}"
>> +               if [ -n "$ref" ]; then
>> +                       git archive --format=tar --prefix="${ref}-archive/" "$ref" \
>> +                               | (cd "$TMP_DIR" && tar xf -)
>> +                       (
>> +                               cd "${TMP_DIR}/${ref}-archive"
>> +                               run_make_headers_install "${TMP_DIR}/${ref}/usr"
>> +                               add_to_incompat_list "$ref" "$INCOMPAT_LIST"
>> +                       )
>> +               else
>> +                       run_make_headers_install "${TMP_DIR}/${ref}/usr"
>> +                       add_to_incompat_list "$ref" "$INCOMPAT_LIST"
> 
> 
> 
> If we drop the dirty tree support, we can make the code simpler.
> 
> $ref would never become empty, and we would always be able to run
> "make headers_install" in the /tmp directory.
> 
> ("make headers_install" in the working tree would create intermediate
> build artifacts in usr/include/)
> 
> That is my personal opinion.
> 
> 
> If you insist on the dirty tree support,
> I will leave it to you.
> 
> 

Dirty tree support is something Greg requested on v1, so I figure we 
should keep it.

> 
> 
> 
> 
> 
>> +               fi
>> +               printf "OK\n"
>> +       done
>> +}
>> +
>> +# Print the path to the headers_install tree for a given ref
>> +get_header_tree() {
>> +       local -r ref="$1"
>> +       printf "%s" "${TMP_DIR}/${ref}/usr"
>> +}
>> +
>> +# Check file list for UAPI compatibility
>> +check_uapi_files() {
>> +       local -r base_ref="$1"
>> +       local -r past_ref="$2"
>> +       local -r abi_error_log="$3"
>> +
>> +       local passed=0;
>> +       local failed=0;
>> +       local -a threads=()
>> +       set -o errexit
>> +
>> +       printf "Checking changes to UAPI headers between %s and %s...\n" "$past_ref" "${base_ref:-dirty tree}"
>> +       # Loop over all UAPI headers that were installed by $past_ref (if they only exist on $base_ref,
>> +       # there's no way they're broken and no way to compare anyway)
>> +       while read -r file; do
>> +               if [ "${#threads[@]}" -ge "$MAX_THREADS" ]; then
>> +                       if wait "${threads[0]}"; then
>> +                               passed=$((passed + 1))
>> +                       else
>> +                               failed=$((failed + 1))
>> +                       fi
>> +                       threads=("${threads[@]:1}")
>> +               fi
>> +
>> +               check_individual_file "$base_ref" "$past_ref" "$file" &
>> +               threads+=("$!")
>> +       done < <(get_file_list "$past_ref")
>> +
>> +       for t in "${threads[@]}"; do
>> +               if wait "$t"; then
>> +                       passed=$((passed + 1))
>> +               else
>> +                       failed=$((failed + 1))
>> +               fi
>> +       done
>> +
>> +       if [ -n "$abi_error_log" ]; then
>> +               printf 'Generated by "%s %s" from git ref %s\n\n' \
>> +                       "$0" "$*" "$(git rev-parse HEAD)" > "$abi_error_log"
>> +       fi
>> +
>> +       while read -r error_file; do
>> +               {
>> +                       cat "$error_file"
>> +                       printf "\n\n"
>> +               } | tee -a "${abi_error_log:-/dev/null}" >&2
>> +       done < <(find "$TMP_DIR" -type f -name '*.error')
> 
> 
> 
> Does this produce this deterministic result?
> 
> 
> Maybe, adding '| sort' after the 'find' command
> will produce the sorted report?
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
>> +
>> +       total="$((passed + failed))"
>> +       if [ "$failed" -gt 0 ]; then
>> +               eprintf "error - %d/%d UAPI headers compatible with %s appear _not_ to be backwards compatible\n" \
>> +                       "$failed" "$total" "$ARCH"
>> +               if [ -n "$abi_error_log" ]; then
>> +                       eprintf "Failure summary saved to %s\n" "$abi_error_log"
>> +               fi
>> +       else
>> +               printf "All %d UAPI headers compatible with %s appear to be backwards compatible\n" \
>> +                       "$total" "$ARCH"
>> +       fi
>> +
>> +       return "$failed"
>> +}
>> +
>> +# Check an individual file for UAPI compatibility
>> +check_individual_file() {
>> +       local -r base_ref="$1"
>> +       local -r past_ref="$2"
>> +       local -r file="$3"
>> +
>> +       local -r base_header="$(get_header_tree "$base_ref")/${file}"
>> +       local -r past_header="$(get_header_tree "$past_ref")/${file}"
>> +
>> +       local base_ref_short="${base_ref:-dirty tree}"
>> +       if [ "${#base_ref_short}" -ge 40 ]; then
>> +               base_ref_short="$(git rev-parse --short "$base_ref_short")"
> 
> 
> 
> I believe this is intended to keep the log short, but
> I think we can simply use the ref name passed by the user.
> If ${ref} is crazily long, it is a user's fault.
> 
> 
> 
> 
> 
> 
> 
>> +       fi
>> +
>> +       local past_ref_short="$past_ref"
>> +       if [ "${#past_ref_short}" -ge 40 ]; then
>> +               past_ref_short="$(git rev-parse --short "$past_ref_short")"
>> +       fi
>> +
>> +       if [ ! -f "$base_header" ]; then
>> +               mkdir -p "$(dirname "$base_header")"
>> +               printf "==== UAPI header %s was removed between %s and %s ====" \
>> +                       "$file" "$past_ref_short" "$base_ref_short" \
>> +                               > "${base_header}.error"
>> +               return 1
>> +       fi
>> +
>> +       compare_abi "$file" "$base_header" "$past_header" "$base_ref" "$past_ref" \
>> +               "$base_ref_short" "$past_ref_short"
>> +}
>> +
>> +# Perform the A/B compilation and compare output ABI
>> +compare_abi() {
>> +       local -r file="$1"
>> +       local -r base_header="$2"
>> +       local -r past_header="$3"
>> +       local -r base_ref="$4"
>> +       local -r past_ref="$5"
>> +       local -r base_ref_short="$6"
>> +       local -r past_ref_short="$7"
>> +       local -r log="${TMP_DIR}/log/${file}.log"
>> +
>> +       mkdir -p "$(dirname "$log")"
>> +
>> +       if ! do_compile "$(get_header_tree "$base_ref")/include" "$base_header" "${base_header}.bin" 2> "$log"; then
>> +               {
>> +                       warn_str=$(printf "==== Could not compile version of UAPI header %s at %s ====\n" \
>> +                               "$file" "$base_ref_short")
>> +                       printf "%s\n" "$warn_str"
>> +                       cat "$log"
>> +                       printf -- "=%.0s" $(seq 0 ${#warn_str})
>> +               } > "${base_header}.error"
>> +               return 1
>> +       fi
>> +
>> +       if ! do_compile "$(get_header_tree "$past_ref")/include" "$past_header" "${past_header}.bin" 2> "$log"; then
>> +               {
>> +                       warn_str=$(printf "==== Could not compile version of UAPI header %s at %s ====\n" \
>> +                               "$file" "$past_ref_short")
>> +                       printf "%s\n" "$warn_str"
>> +                       cat "$log"
>> +                       printf -- "=%.0s" $(seq 0 ${#warn_str})
>> +               } > "${base_header}.error"
> 
> 
> 
> You used  >"${base_header}.error" instead of
>> "${past_header}.error" here.
> 
> I guess it is intentional.
> 
> 
> 
> But, I think you can put *.error files
> under the ${TMP_DIR}/log/ directory if you save the log
> from base_ref and past_ref into the same log file.
> 
> 
> For example,
> 
> 
>     local -r error_log="${TMP_DIR}/log/${file}.error"
> 
> 
> Then,
> 
>      {
>            ...
> 
>      } > "${error_log}"
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
>> +               return 1
>> +       fi
>> +
>> +       local ret=0
>> +       "$ABIDIFF" --non-reachable-types \
>> +               --suppressions "$SUPPRESSIONS" \
>> +               "${past_header}.bin" "${base_header}.bin" > "$log" || ret="$?"
>> +       if [ "$ret" -eq 0 ]; then
>> +               if [ "$VERBOSE" = "true" ]; then
>> +                       printf "No ABI differences detected in %s from %s -> %s\n" \
>> +                               "$file" "$past_ref_short" "$base_ref_short"
>> +               fi
>> +       else
>> +               # Bits in abidiff's return code can be used to determine the type of error
>> +               if [ $((ret & 0x2)) -gt 0 ]; then
>> +                       eprintf "error - abidiff did not run properly\n"
>> +                       exit 1
>> +               fi
>> +
>> +               if [ "$IGNORE_AMBIGUOUS_CHANGES" = "true" ] && [ "$ret" -eq 4 ]; then
>> +                       return 0
>> +               fi
>> +
>> +               # If the only changes were additions (not modifications to existing APIs), then
>> +               # there's no problem. Ignore these diffs.
>> +               if grep "Unreachable types summary" "$log" | grep -q "0 removed" &&
>> +                  grep "Unreachable types summary" "$log" | grep -q "0 changed"; then
>> +                       return 0
>> +               fi
>> +
>> +               {
>> +                       warn_str=$(printf "==== ABI differences detected in %s from %s -> %s ====" \
>> +                               "$file" "$past_ref_short" "$base_ref_short")
>> +                       printf "%s\n" "$warn_str"
>> +                       sed  -e '/summary:/d' -e '/changed type/d' -e '/^$/d' -e 's/^/  /g' "$log"
>> +                       printf -- "=%.0s" $(seq 0 ${#warn_str})
>> +                       if cmp "$past_header" "$base_header" > /dev/null 2>&1; then
>> +                               printf "\n%s did not change between %s and %s...\n" "$file" "$past_ref" "${base_ref:-dirty tree}"
>> +                               printf "It's possible a change to one of the headers it includes caused this error:\n"
>> +                               grep '^#include' "$base_header"
>> +                               printf "\n"
>> +                       fi
>> +               } > "${base_header}.error"
>> +
>> +               return 1
>> +       fi
>> +}
>> +
>> +# Check that a minimum software version number is satisfied
>> +min_version_is_satisfied() {
>> +       local -r min_version="$1"
>> +       local -r version_installed="$2"
>> +
>> +       printf "%s\n%s\n" "$min_version" "$version_installed" \
>> +               | sort -Vc > /dev/null 2>&1
>> +}
>> +
>> +# Make sure we have the tools we need and the arguments make sense
>> +check_deps() {
>> +       ABIDIFF="${ABIDIFF:-abidiff}"
>> +       CC="${CC:-gcc}"
>> +       ARCH="${ARCH:-$(uname -m)}"
>> +       if [ "$ARCH" = "x86_64" ]; then
>> +               ARCH="x86"
>> +       fi
>> +
>> +       local -r abidiff_min_version="2.4"
>> +       local -r libdw_min_version_if_clang="0.171"
>> +
>> +       if ! command -v "$ABIDIFF" > /dev/null 2>&1; then
>> +               eprintf "error - abidiff not found!\n"
>> +               eprintf "Please install abigail-tools version %s or greater\n" "$abidiff_min_version"
>> +               eprintf "See: https://sourceware.org/libabigail/manual/libabigail-overview.html\n"
>> +               return 1
>> +       fi
>> +
>> +       local -r abidiff_version="$("$ABIDIFF" --version | cut -d ' ' -f 2)"
>> +       if ! min_version_is_satisfied "$abidiff_min_version" "$abidiff_version"; then
>> +               eprintf "error - abidiff version too old: %s\n" "$abidiff_version"
>> +               eprintf "Please install abigail-tools version %s or greater\n" "$abidiff_min_version"
>> +               eprintf "See: https://sourceware.org/libabigail/manual/libabigail-overview.html\n"
>> +               return 1
>> +       fi
>> +
>> +       if ! command -v "$CC" > /dev/null 2>&1; then
>> +               eprintf 'error - %s not found\n' "$CC"
>> +               return 1
>> +       fi
>> +
>> +       if "$CC" --version | grep -q clang; then
>> +               local -r libdw_version="$(ldconfig -v 2>/dev/null | grep -v SKIPPED | grep -m 1 -o 'libdw-[0-9]\+.[0-9]\+' | cut -c 7-)"
>> +               if ! min_version_is_satisfied "$libdw_min_version_if_clang" "$libdw_version"; then
>> +                       eprintf "error - libdw version too old for use with clang: %s\n" "$libdw_version"
>> +                       eprintf "Please install libdw from elfutils version %s or greater\n" "$libdw_min_version_if_clang"
>> +                       eprintf "See: https://sourceware.org/elfutils/\n"
>> +                       return 1
>> +               fi
>> +       fi
>> +
>> +       if [ ! -d "arch/${ARCH}" ]; then
>> +               eprintf 'error - ARCH "%s" is not a subdirectory under arch/\n' "$ARCH"
>> +               eprintf "Please set ARCH to one of:\n%s\n" "$(find arch -maxdepth 1 -mindepth 1 -type d -printf '%f ' | fmt)"
>> +               return 1
>> +       fi
>> +
>> +       if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
>> +               eprintf "error - this script requires the kernel tree to be initialized with Git\n"
>> +               return 1
>> +       fi
>> +
>> +       if ! git rev-parse --verify "$past_ref" > /dev/null 2>&1; then
>> +               printf 'error - invalid git reference "%s"\n' "$past_ref"
>> +               return 1
>> +       fi
>> +
>> +       if [ -n "$base_ref" ]; then
>> +               if ! git merge-base --is-ancestor "$past_ref" "$base_ref" > /dev/null 2>&1; then
>> +                       printf 'error - "%s" is not an ancestor of base ref "%s"\n' "$past_ref" "$base_ref"
>> +                       return 1
>> +               fi
>> +               if [ "$(git rev-parse "$base_ref")" = "$(git rev-parse "$past_ref")" ]; then
>> +                       printf 'error - "%s" and "%s" are the same reference\n' "$past_ref" "$base_ref"
>> +                       return 1
>> +               fi
>> +       fi
>> +}
>> +
>> +run() {
>> +       local base_ref="$1"
>> +       local past_ref="$2"
>> +       local abi_error_log="$3"
>> +       shift 3
>> +
>> +       if [ -z "$KERNEL_SRC" ]; then
>> +               KERNEL_SRC="$(realpath "$(dirname "$0")"/..)"
>> +       fi
>> +
>> +       cd "$KERNEL_SRC"
>> +
>> +       if [ -z "$base_ref" ] && ! tree_is_dirty; then
>> +               base_ref=HEAD
>> +       fi
>> +
>> +       if [ -z "$past_ref" ]; then
>> +               if [ -n "$base_ref" ]; then
>> +                       past_ref="${base_ref}^1"
>> +               else
>> +                       past_ref=HEAD
>> +               fi
>> +       fi
>> +
>> +       if ! check_deps; then
>> +               exit "$FAIL_PREREQ"
>> +       fi
>> +
>> +       TMP_DIR=$(mktemp -d)
>> +       readonly TMP_DIR
>> +       trap 'rm -rf "$TMP_DIR"' EXIT
>> +
>> +       readonly INCOMPAT_LIST="${TMP_DIR}/incompat_list.txt"
>> +       touch "$INCOMPAT_LIST"
>> +
>> +       readonly SUPPRESSIONS="${TMP_DIR}/suppressions.txt"
>> +       gen_suppressions > "$SUPPRESSIONS"
>> +
>> +       # Run make install_headers for both refs
>> +       install_headers "$base_ref" "$past_ref"
>> +
>> +       # Check for any differences in the installed header trees
>> +       if diff -r -q "$(get_header_tree "$base_ref")" "$(get_header_tree "$past_ref")" > /dev/null 2>&1; then
>> +               printf "No changes to UAPI headers were applied between %s and %s\n" "$past_ref" "${base_ref:-dirty tree}"
>> +               exit "$SUCCESS"
>> +       fi
>> +
>> +       if ! check_uapi_files "$base_ref" "$past_ref" "$abi_error_log"; then
>> +               exit "$FAIL_ABI"
>> +       fi
>> +}
>> +
>> +main() {
>> +       MAX_THREADS=$(nproc)
>> +       VERBOSE="false"
>> +       IGNORE_AMBIGUOUS_CHANGES="false"
>> +       quiet="false"
>> +       local base_ref=""
>> +       while getopts "hb:p:j:l:iqv" opt; do
>> +               case $opt in
>> +               h)
>> +                       print_usage
>> +                       exit "$SUCCESS"
>> +                       ;;
>> +               b)
>> +                       base_ref="$OPTARG"
>> +                       ;;
>> +               p)
>> +                       past_ref="$OPTARG"
>> +                       ;;
>> +               j)
>> +                       MAX_THREADS="$OPTARG"
>> +                       ;;
>> +               l)
>> +                       abi_error_log="$OPTARG"
>> +                       ;;
>> +               i)
>> +                       IGNORE_AMBIGUOUS_CHANGES="true"
>> +                       ;;
>> +               q)
>> +                       quiet="true"
>> +                       VERBOSE="false"
>> +                       ;;
>> +               v)
>> +                       VERBOSE="true"
>> +                       quiet="false"
>> +                       ;;
>> +               *)
>> +                       exit "$FAIL_PREREQ"
>> +               esac
>> +       done
>> +
>> +       if [ "$quiet" = "true" ]; then
>> +               exec > /dev/null 2>&1
>> +       fi
>> +
>> +       run "$base_ref" "$past_ref" "$abi_error_log" "$@"
>> +}
>> +
>> +main "$@"
>> --
>> 2.17.1
>>
> 
> 
> --
> Best Regards
> 
> Masahiro Yamada

